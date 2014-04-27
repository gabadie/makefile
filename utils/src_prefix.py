#!/usr/bin/env python
# coding=utf8

import argparse
import fnmatch
import glob
import os
import sys


# ------------------------------------------------------------------------------ Comment policies

class CommentPolicy:
    """ Abstract language's comment policy

    members:
        name = str()
    """

    def __init__(self, name):
        self.name = name

    def prunes_prefix(self, file_content):
        """ Returns <file_content> without the prefix
        """
        assert False # should have been implemented

    def append_prefix(self, file_content, prefix):
        """ Appends the prefix to the file_content
        """
        assert False # should have been implemented


class CCommentPolicy(CommentPolicy):
    """ C/C++ language comment policy
    """

    def __init__(self, name):
        CommentPolicy.__init__(self, name)

    def prunes_prefix(self, file_content):
        if not file_content[0].startswith('/*'):
            return file_content

        file_content = file_content[1:]

        while file_content[0].startswith(' *'):
            file_content = file_content[1:]

            if len(file_content) == 0:
                return []

        return file_content

    def prefix_comment(self, prefix):
        prefix_comment = list()
        prefix_comment.append('/*')

        for line in prefix:
            prefix_comment.append(' *  {}'.format(line))

        prefix_comment.append(' */')
        return prefix_comment


class HashCommentPolicy(CommentPolicy):
    """ Python language comment policy
    """

    def __init__(self, name):
        CommentPolicy.__init__(self, name)

    def prunes_prefix(self, file_content):
        while file_content[0].startswith('#'):
            file_content = file_content[1:]

            if len(file_content) == 0:
                return []

        return file_content

    def prefix_comment(self, prefix):
        prefix_comment = list()

        if self.name == 'python':
            prefix_comment.append('#!/usr/bin/env python')
            prefix_comment.append('# coding=utf8')

        elif self.name == 'shell':
            prefix_comment.append('#!/bin/sh')

        elif self.name not in ['flist', 'makefile']:
            assert False

        prefix_comment.append('#')

        for line in prefix:
            prefix_comment.append('#   {}'.format(line))

        prefix_comment.append('#')
        return prefix_comment


comment_policies = dict()
comment_policies['c'] = CCommentPolicy('c')
comment_policies['c++'] = CCommentPolicy('c++')
comment_policies['c/c++'] = CCommentPolicy('c/c++')
comment_policies['flist'] = HashCommentPolicy('flist')
comment_policies['makefile'] = HashCommentPolicy('makefile')
comment_policies['python'] = HashCommentPolicy('python')
comment_policies['shell'] = HashCommentPolicy('shell')


# ------------------------------------------------------------------------------ main entry point

def main(args):
    policy = comment_policies[args.language]
    prefix_text = [l[:-1] for l in args.prefix]
    prefix = policy.prefix_comment(prefix_text)

    if len(args.files) == 0:
        print '{}'.format('\n'.join(prefix))

        return 0

    files = list()

    for file_regex in args.files:
        if args.recursive:
            for root, dirnames, filenames in os.walk('./'):
                for filename in fnmatch.filter(filenames, file_regex):
                    f = '{}/{}'.format(root, filename)

                    if f in files:
                        continue

                    files.append(f)

        else:
            for f in glob.glob(file_regex):
                if f in files:
                    continue

                if not os.path.isfile(f):
                    continue

                files.append(f)

    for file_path in files:
        if args.verbose:
            print '{}'.format(file_path)

        if args.no_processing:
            continue

        file_content = list()
        file_content.extend(prefix)

        with open(file_path, 'r') as f:
            file_original_content = [l[:-1] for l in f]

            file_content.extend(policy.prunes_prefix(file_original_content))

        with open(file_path, 'w') as f:
            f.write('\n'.join([l.rstrip() for l in file_content]))
            f.write('\n')

    return 0


if __name__ == '__main__':
    languages = comment_policies.keys()
    languages.sort()

    parser = argparse.ArgumentParser()
    parser.add_argument("-v", "--verbose",
        help="list al processed files",
        action="store_true"
    )
    parser.add_argument("-r", "--recursive",
        help="recursively search subdirectories listed",
        action="store_true"
    )
    parser.add_argument("-n", "--no-processing",
        help="do not process files",
        action="store_true"
    )
    parser.add_argument("language",
        help="the source code language",
        choices=languages,
        type=str
    )
    parser.add_argument("prefix",
        metavar='prefix',
        help="the prefix to append to all files",
        type=file
    )
    parser.add_argument('files',
        metavar='file',
        help="files to append the prefix to",
        type=str,
        nargs='*'
    )
    args = parser.parse_args()

    r = main(args)

    sys.exit(r)
