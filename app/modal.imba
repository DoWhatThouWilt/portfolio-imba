import './styles'

tag modal
	css .modal
		bgc:$container-color rd:10px max-width:968px m:50px auto p:20px pos:relative
		shadow:0 2px 4px black/15
	prop auto-close\boolean = true
	prop header
	isShown?\boolean = false
	_placement
	body = document.querySelector('body')

	def show
		isShown? = true
		scrollBarWidth = window.innerWidth - document.body.offsetWidth
		body.style.marginRight = scrollBarWidth
		body.style.overflow = 'hidden'
		header.style.display = 'none'
	def hide
		isShown? = false
		body.style.marginRight = ''
		body.style.overflow = ''
		header.style.display = ''
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
							<div[overflow:auto pos:fixed w:100% h:100% t:0 l:0 z:99998 bg:black/20%
							p:0 20px] @click.stop=hide >
								<div.modal @click.stop={dropDownClick}>
									<i.uil.uil-times.services-modal-close
									[fs:1.25rem pos:absolute t:1rem r:1rem c:$color-1 cursor:pointer]
									@click.stop=hide>
									<slot name="dropdown">
