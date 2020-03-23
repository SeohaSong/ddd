from . import os
from .common import readTable, dumpTable

def sumUpFailedReports(path):
    names = ['founded utterance id', 'founded utterance pattern']
    files = os.listdir(path)
    infos = []
    for file_ in files:
        file_ = os.path.join(path, file_)
        header, rows = readTable(file_, ',', True)
        idxs = [header.index(v) for v in names]
        for row in rows:
            id_ = row[idxs[0]]
            if id_[0] != 't':
                print(id_)
                print(file_)
                exit()
            infos.append((row[idxs[0]], row[idxs[1]]))
    rows = sorted(set(infos))
    dumpTable(path + '.csv', names, rows, sep=',')
