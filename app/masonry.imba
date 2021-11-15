tag masonry
	css 
		.item d:inline-block mb:2 w:100%
		.gi d:flex jc:center ai:center fs:4rem @!768:calc(4rem * .75) c:white
		.circle p:0 rd:full d:flex ai:center jc:center bgs:cover bgp:center
		.square bgc:$square-color
		$col:100px
		$lgCol:calc($col / 0.75)
		@!768
			$col:75px
				

	<self[d:vflex jc:center ai:center]>
		<div[d:grid gtc:3fr 3fr 4fr gtr:$col $col $lgCol]>
			<div.gi.square[gc:span 2 gr: span 2 d:flex ai:center jc:center fs:5rem @!768:calc(5rem * .75)]>
				<span.iconify data-icon="simple-icons:css3">	
			<div.gi[gr:span 2 ai:flex-end]>
				<div.circle [h:$lgCol w:$lgCol bgi:url('./img/ruby.svg')]>
					<span.iconify data-icon="whh:ruby">	
			<div.gi[gc:span 2]>
				<div.circle [h:$lgCol w:$lgCol bgi:url('./img/purp2.svg')]>
					<span.iconify data-icon="simple-icons:elixir">	
			<div.gi.square[fs:3rem @!768:calc(3rem * .75)]>
				<span.iconify data-icon="teenyicons:python-outline">	