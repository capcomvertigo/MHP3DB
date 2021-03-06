<h1>{{ icon( "equipment/" .. class.short, piece.rarity ) }} {{ T( piece.name ) }}</h1>


<h2>Stats</h2>

	Defense: {{ piece.defense }}<br>

	Fire res:    {{ piece.fireRes }}<br>
	Water res:   {{ piece.waterRes }}<br>
	Thunder res: {{ piece.thunderRes }}<br>
	Ice res:     {{ piece.iceRes }}<br>
	Dragon res:  {{ piece.dragonRes }}<br>

	Rarity: <span class="rare{{ piece.rarity }}">{{ piece.rarity }}</span>

	{%
	if piece.skills then
		print( "<h3>Skills</h3>" )

		for _, skill in ipairs( piece.skills ) do
			-- :)
			local form =
				skill.points > 0 and
					"%s: +%d"
				or skill.points < 0 and
					"%s: <span class=\"neg\">%d</span>"
				or
					"%s"

			printf( form .. "<br>", T( Skills[ skill.id ].name ), skill.points )
		end
	end
	%}


<h2>Crafting</h2>

	{%
	if piece.create then
		print( "<h3>Create</h3>" )

		print( itemCounts( { materials = piece.create } ) )
		printf( "Price: %sz", commas( piece.price ) )
	end

	if piece.scraps then
		print( "<h3>Scraps</h3>" )

		print( itemCounts( { materials = piece.scraps } ) )
	end
	%}
