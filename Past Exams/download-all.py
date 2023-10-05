import requests, os, bs4

BASE_URL = "https://cs110.students.cs.ubc.ca/exams/"

def extract_links(url):
    soup = bs4.BeautifulSoup(requests.get(url).text, features="lxml")
    hyperlinks = []
    links = soup.find_all("a") # Find all elements with the tag <a>
    
    for link in links[5:]:
        hyperlinks.append(link.get("href"))

    return hyperlinks

structure = {} # dict to structure files in the form {folder: files}

folders = set(extract_links(BASE_URL))

# [print(x) for x in folders]
for folder in folders:
    files = extract_links(BASE_URL+folder)
    structure[folder] = files

for folder in structure:
    print("="*(len(folder)+4))
    print("  "+folder)
    print("="*(len(folder)+4))

    os.mkdir(folder)
    os.chdir(folder)

    print("created " + folder + "\n")

    for file in structure[folder]:
        data = requests.get(f"{BASE_URL}/{folder}/{file}", allow_redirects=True).content
        open(file, "wb").write(data)
        print("added: "+file)

    os.chdir("..")
