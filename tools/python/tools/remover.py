from .common import findFile, readTable


def removeLine(root, vid):

    idxs = []
    file_key=r".+\.training\.bxb|.+\.training\.6t"
    res = findFile(vid, root, file_key=file_key)

    if res:
        path, idx = res
        with open(path, encoding='utf8') as f:
            lines = f.readlines()
        idx -= 1
        chk = True
        while chk:
            idxs.append(idx + 1)
            if lines[idx].replace('\n', '') == '}':
                chk = False
            lines[idx] = '\n'
            idx += 1
        with open(path, 'w', encoding='utf8') as f:
            f.write(''.join(lines))
    else:
        path, idxs = None, None

    print("[REMOVED LINES]")
    print("    vid      :", vid)
    print("    file     :", path)
    print("    lines    :", idxs)

    return path


def removeLines(root, file_):
    
    header, rows = readTable(file_, ',', True)
    idx = header.index('founded utterance id')
    ids = sorted(set(v[idx] for v in rows))

    paths = []
    for id_ in ids:
        paths.append(removeLine(root, id_))
        
    print("[RESULT]")
    cnt = 0
    for idx, id_ in enumerate(ids):
        result = "not found"
        if paths[idx]:
            result = "removed"
            cnt += 1
        print("    %s => %s" % (id_, result))
    print("    %d/%d removed." % (cnt, len(ids)))
