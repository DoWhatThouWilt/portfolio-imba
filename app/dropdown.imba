tag dropdown
	css .center 
		t:50% l:50% x:-50% y:-50% h:82.5vh max-height:100% ofy:auto w:968px 
		max-width:100% bgc:$container-color rd:16px shadow:0 2px 4px black/15 
	prop auto-close\boolean = true
	prop placement\"bottom-end"|"bottom-start"|"top-end"|"top-start"
	isShown?\boolean = false
	_placement
	# def setup
	# 	_placement = placements[placement]
	def show
		isShown? = true
	def hide
		isShown? = false
	def dropDownClick
		if auto-close
			hide!
		else
			show!
	def relayout
		const target = querySelector("#dropdown")

	def render
		<self>
			<button[bd:0 rd:0 bgc:transparent p:0] type="button" @click=show>
				<slot />
				if isShown?
					<global>
						<div[o@off:0] ease>
							<div[pos:fixed t:0 r:0 l:0 b:0 z:99998 bg:black/20%] @click.stop=hide >
							<div[pos:fixed zi:99999].center @click.stop={dropDownClick}>
								<i.uil.uil-times.services-modal-close
								[fs:1.25rem pos:absolute t:1rem r:1rem c:$color-1 cursor:pointer]
								@click.stop=hide>
								<slot name="dropdown">
