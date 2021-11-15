import 'flickity/css/flickity.css'
import Flickity from 'flickity'
import './styles'

tag flickity
	def mount
		flkty = new Flickity('.carousel', {
			freeScroll: true,
			contain: true,
			prevNextButtons: false,
			pageDots: false
		})	
	
	css
		.carousel-cell
			w:100% @960:90% mr:1rem h:auto @768:400px
			d:flex jc:center ai:center
		.carousel-cell img
			d:block max-height:100% max-width:100% rd:12px
		.tech div fs:$sm-fs px:5 py:3 pt:4 bd:black/12 1px solid rd:10px
		.description max-width:40rem c:$text-color lh:1.4

	<self>
		<slot>
		# <div[py:4 bdb:black/8 1px solid]>
		# 	<h2[fs:$h1 fw:600 c:$title-color]> "Multi-Step Moving Form"
		# 	<p[mt:1 fs:$sm-fs]> "A dynamic form tailored to the needs of moving customers"
		# <p[tt:uppercase fs:$sm-fs my:4]> "tech"
		# <div[d:flex cg:4].tech> 
		# 	<div> "Imba"
		# 	<div> "Robot3"
		# <div.carousel[mt:4]>
		# 	<div.carousel-cell>
		# 		<img src="./img/movingform1.png">
		# 	<div.carousel-cell>
		# 		<img src="./img/movingform2.png">
		# 	<div.carousel-cell>
		# 		<img src="./img/movingform3.png">
		# <div[d:grid rg:4 mt:6]>
		# 	<p.description>
		# 		"""
		# 		The form I created for moving companies is a multi-step process that takes
		# 		 the necessary customer information and inventory of objects needing moved. 
		# 		 It would collect this data about where they need their items moved to ensures
		# 		  movers will have all required knowledge before performing job smoothly! 
		# 		"""
		# 	<p.description>
		# 		"""
		# 		 First off you'll need your basic contact details like name or phone number;
		# 		then more specific stuff about where things are going - how many rooms does this move
		# 		 include? What type if furniture do we have in each space? The form presents a 
		# 		 summary of the furniture items and boxes, allowing customers to make changes before 
		# 		 submitting their information.
		# 		"""
		# <a.button.button-small[mt:6 px:12 py:2 pt:3 rd:xl]> "Visit"