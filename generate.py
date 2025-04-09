path = ""

import csv
from cairosvg import svg2png
for deck in ("cards", "events"):
	with open(f"{path}{deck}.tsv") as file:
		data = list(csv.reader(file, delimiter="\t"))
		cards = [{data[0][i]: line[i] for i in range(len(data[0]))} for line in data[1:]]

	with open(f"{path}{deck}_template.svg") as file:
		data = file.read()

	group_regex = "<g(?:[\n]|.)*</g>"

	import re
	group = re.findall(group_regex, data)[0]

	card_groups = ""
	for card_i in range(len(cards)):
		card = cards[card_i]
		x = (card_i % 10) * 70
		y = (card_i // 10) * 100

		result = group

		coords = re.findall('[xy]="[0-9.]*"', result)
		for match in coords:
			number = float(match[3:-1])
			if match[0] == "x":
				number += x
			else:
				number += y
			result = re.sub(match, f'{match[0]}="{number}"', result)
		
		# re.sub("""width="70"\s*height="100"\s*x="0"\s*y="0""", f"""width="70" height="100" x="{x}" y="{y}""", group)

		for key in card:
			lines = re.findall(f"&lt;{key}[0-9]+ *&gt;", result)
			# print(lines)
			if len(lines):
				remaining = card[key].split()
				for i in range(len(lines)):
					space = len(lines[i]) - len("&gt;&lt;")
					text = ""
					while remaining:
						if len(text) + 1 + len(remaining[0]) <= space:
							text += " " + remaining.pop(0)
						else:
							break
					result = re.sub(lines[i], text, result)
			else:
				result = re.sub(f"&lt;{key} *&gt;", card[key], result)
		card_groups += result

	result = re.sub(group_regex, card_groups, data)
	# with open(f"{path}{deck}_exported.svg", "w+") as file:
	# 	print(result, file=file)
	svg2png(bytestring=result, write_to=f"{path}{deck}.png")
