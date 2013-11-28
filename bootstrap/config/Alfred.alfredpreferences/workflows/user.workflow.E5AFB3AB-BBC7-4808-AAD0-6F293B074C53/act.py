import alp
from subprocess import check_output


def scpt(innards):
    return '''
tell application "Things"
    {0}
end tell'''.format(innards)


def scpt_act(innards):
    return '''
tell application "Things"
    activate
    set index of window "Things" to 1
    {0}
end tell'''.format(innards)

def process():
    args = alp.args()

    if args[0] == "parse":
        inp = args[1]
        if "\"" in inp:
            inp = inp.replace("\"", "\\\"")        
        o = check_output(["osascript", "-e", scpt("parse quicksilver input \"{0}\"".format(inp))])
        print "Task added."
    elif args[0] == "show":
        thing = args[1]
        inp = args[2]
        if "\"" in inp:
            inp = inp.replace("\"", "\\\"")
        o = check_output(["osascript", "-e", scpt_act("show ({0} named \"{1}\")".format(thing, inp))])


if __name__ == "__main__":
    process()
