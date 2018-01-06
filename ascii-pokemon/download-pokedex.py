import os
import requests
from itertools import izip

# create file of urls for all the pokemon
urls = open('pokemon_urls', 'w')
for i in range(1,135):
    urls.writelines('http://www.fiikus.net/asciiart/pokemon/{num:03d}.txt\n'.format(num=i))

# create list of pokemon
pokedex_url = 'http://www.fiikus.net/?pokedex'
r = requests.get(pokedex_url, allow_redirects=True)
open('pokedex_html', 'wb').write(r.content)
os.system("cat pokedex_html  | grep 'asciiart/pok' | cut -d '#' -f2 | cut -c 5- | cut -d '<' -f1 > pokedex_")

# open both files and download the pokemon, naming every txt file <pokemon>.txt
with open('pokedex_', 'r') as pokedex, open('pokemon_urls', 'r') as urls:
    for pokemon_name, url in izip(pokedex, urls):
        cmd = "wget --quiet --output-document=\""+pokemon_name.strip()+".txt\" "+url.strip()
        os.system(cmd)

os.system("rm -rf poke* && mkdir pokedex && mv *.txt pokedex")
