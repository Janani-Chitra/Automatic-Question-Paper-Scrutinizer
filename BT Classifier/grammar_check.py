import sys
if(len(sys.argv)==1):
    print('Pass text as arg!!!')
    exit()
text=sys.argv[1]
from gingerit.gingerit import GingerIt
parser = GingerIt()
parser.parse(text)
print(parser.parse(text)['result'])