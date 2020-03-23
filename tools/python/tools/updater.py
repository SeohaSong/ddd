from . import re, os

from .common import findFile, readTable, dumpTable
from .fixer import fixLineBreak


def preprocess(file_, tmp_file):

    fixLineBreak(file_)

    header, rows = readTable(file_, '\t', True)
    with open(tmp_file, encoding='utf8') as f:
        lines = f.readlines()
    
    idx = 0
    infos = []
    nums = []
    proc = re.compile(r"^utt \(.+\) process Time: .+")
    num_proc = re.compile(r".+ ([0-9.]+)ms$")
    name2idx = {v: header.index(v) for v in header}
    for row in rows:
        while lines[idx].find("\"" + row[name2idx['Utterance']] + "\"") < 0:
            idx += 1
        if row[name2idx['eNLUResult']] == 'NULL':
            infos.append(('EMPTY', 'EMPTY'))
        else:
            while lines[idx].find("Domain : ") < 0:
                idx += 1
            dom = lines[idx].split()[2]
            while lines[idx].find("VariantId : ") < 0:
                idx += 1
            vid = lines[idx].split()[2]
            infos.append((vid, dom))
        str_ = "Could not handle json request from client.."
        if lines[idx + 1].find(str_) >= 0:
            nums.append(0.0)
        else:
            while not proc.match(lines[idx]):
                idx += 1
            nums.append(float(num_proc.match(lines[idx]).group(1)))

    return header, rows, nums, infos


def updateFile(header, rows, nums, file_):
    name = "Latency (ms)"
    if header[-1] == name:
        return
    header.append(name)
    for idx, row in enumerate(rows):
        row.append(nums[idx])
    dumpTable(file_, header, rows, '\t')


def createFile(header, rows, infos, file_, root):

    k2utt = {}
    for vid, dom in sorted(set(infos)):
        if vid == 'EMPTY':
            k2utt[vid] = 'EMPTY'
            continue
        root_ = os.path.join(root, 'capsules', dom)
        file_key=r".+\.training\.bxb|.+\.training\.6t"
        path, idx = findFile(vid, root_, file_key=file_key)
        with open(path, encoding='utf8') as f:
            lines = f.readlines()
        utt = ""
        while "utterance" not in utt:
            utt = lines[idx]
            idx += 1
        k2utt[vid] = utt.split('"')[1]

    idx = header.index("Overall Result")
    idxs = [i for i, v in enumerate(rows) if v[idx] == 'FAILED']
    new_rows = []
    for idx in idxs:
        row = rows[idx]
        key = infos[idx][0]
        utt = k2utt[key]
        new_row = [row[header.index('Utterance')],
                   row[header.index('eNLUResult')],
                   row[header.index('GroundTruth')],
                   key,
                   utt]
        new_rows.append(new_row)
    new_header = [
        "utterance",
        "result",
        "ground truth",
        "founded utterance id",
        "founded utterance pattern"
    ]
    dumpTable(file_, new_header, new_rows, ',')
