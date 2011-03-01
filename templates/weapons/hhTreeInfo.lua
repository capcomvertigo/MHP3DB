<td>{{ ( "&nbsp;&nbsp;&nbsp;" ):rep( depth ) }}<a class="rare{{ weapon.rarity }}{{ weapon.create and " create" or "" }}" href="{{ U( ( "weapons/%s/%s" ):format( class.short, urlFromName( weapon.name ) ) ) }}">{{ T( weapon.name ) }}</a></td>
<td>{{ weapon.attack }}</td>
<td>{{ getTATP( weapon ) }}</td>

<td>{%
for _, note in ipairs( weapon.notes ) do
	print( ( "<span class='note%s'>%s</span>" ):format( note, Special.note ) )
end
%}</td>

{{ weapon.element and ( "<td class='elem%s'>%d" ):format( weapon.element, weapon.elemAttack ) or "<td class='none'>-" }}</td>
<td{{ weapon.affinity ~= 0 and ( ( " class='%s'" ):format( weapon.affinity > 0 and "pos" or "neg" ) ) or ""}}>{{ weapon.affinity }}%</td>
<td>{{ weapon.sharpness and sharpness( { weapon = weapon } ) or "?" }}</td>
<td{{ weapon.slots == 0 and " class='none'>-" or ">" .. ( "O" ):rep( weapon.slots ) }}</td>
