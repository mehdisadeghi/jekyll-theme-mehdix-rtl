'''Netlify comments processing script.'''
import os
import json
import hashlib
from collections import OrderedDict

import yaml
import requests

COMMENT_DIR = './_data/comments'

ACCESS_TOKEN = os.environ.get('NETLIFY_ACCESS_TOKEN')
FORM_ID = os.environ.get('NETLIFY_FORM_ID')
SITE_ID = os.environ.get('NETLIFY_SITE_ID')

BASE = 'https://api.netlify.com/api/v1'
SITE = f'{BASE}/sites/{SITE_ID}'
SUBMISSIONS_ENDPOINT = f'{SITE}/forms/{FORM_ID}/submissions?access_token={ACCESS_TOKEN}'


def get_comments():
    '''Get a map of post_uuid => list of comment dicts.'''
    raw_comments = requests.get(f'{SITE}/forms/{FORM_ID}/submissions',
                                params={'access_token': ACCESS_TOKEN})
    comments = json.loads(raw_comments.content.decode('utf-8'))
    comments.sort(key=lambda x: x['number'])
    result = OrderedDict()
    for comment in comments:
        key = comment['data']['page_uuid']
        if key not in result:
            result[key] = []
        result[key].append(comment)
    return result


def transform_comment(netlify_comment):
    '''Convert Netlify form data to a normal comment.'''
    data = netlify_comment['data']
    return {'page_id': data['page_id'],
            'page_uuid': data['page_uuid'],
            'page_date': data['page_date'],
            'page_title': data['page_title'],
            'date': netlify_comment['created_at'],
            'name': data['name'],
            'email': hashlib.md5(data['email'].encode('ascii')).hexdigest(),
            'website': data['website'],
            'message': data['message']}


def update_comments(file, comments):
    '''Update comments in the YAML data files of each post.'''
    file.seek(0)
    old_comments = yaml.load(file) or []
    old_comment_ids = [cmnt['page_uuid'] for cmnt in old_comments]
    new_comments = list(filter(lambda x: x['page_uuid'] not in old_comment_ids,
        map(transform_comment, comments)))
    if new_comments:
        yaml.dump(new_comments,
            file,
            default_flow_style=False,
            allow_unicode=True)


def main():
    '''Update comments.'''
    netlify_comments = get_comments()
    for uuid, comments in netlify_comments.items():
        with open(os.path.join(COMMENT_DIR, f'{uuid}.yml'), 'a+') as file:
            update_comments(file, comments)


if __name__ == '__main__':
    main()
