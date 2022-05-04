import json
import os

output_path = './videos'
json_path = 'dataset_info/finegym/annotations/finegym_annotation_info_v1.1.json'

if not os.path.exists(output_path):
    os.mkdir(output_path)

data = json.load(open(json_path, 'r'))
youtube_ids = list(data.keys())

for youtube_id in youtube_ids:
    vid_loc = output_path + '/' + str(youtube_id)
    url = 'http://www.youtube.com/watch?v=%s' % youtube_id
    if not os.path.exists(vid_loc):
        os.mkdir(vid_loc)
    os.system('youtube-dl -o ' + vid_loc + '/' + youtube_id + '.mp4' + ' -f best ' + url)