from . import re


def fixLineBreak(file_):

    lines = []
    with open(file_, encoding='utf8') as f:
        lines_ = f.readlines()

    for line in lines_:
        line = re.sub(r'\s*$', '', line)
        if line[0] == '\t':
            line = re.sub(r'^\t+', '', line)
            line_ = re.sub(r'\s*$', '', lines[-1])
            lines[-1] = '\t'.join([line_, line])
        else:
            lines.append(line)

    with open(file_, 'w', encoding='utf8') as f:
        f.write('\n'.join(lines))
