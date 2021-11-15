import 'flickity/css/flickity.css'
import Flickity from 'flickity'
import './styles'

tag flickity-test
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

	<self[max-width:968px mx:auto]>
		<div[py:4 bdb:black/8 1px solid]>
			<h2[fs:$h1 fw:600 c:$title-color]> "Moving Leads Form"
			<p[mt:1 fs:$sm-fs]> "A dynamic form tailored to the needs of moving customers"
		<p[tt:uppercase fs:$sm-fs my:4]> "tech"
		<div[d:flex cg:4].tech> 
			<div> "Wordpress"
			<div> "REST API"
			<div> "PHP"
			<div> "Svelte"
			<div> "Imba"
		<div.carousel[mt:4]>
			<div.carousel-cell>
				<img src="./img/lead-form.gif">
			<div.carousel-cell>
				<img src="./img/wordpress-1.png">
			<div.carousel-cell>
				<img src="./img/formine.png">
			<div.carousel-cell>
				<img src="./img/formine1.png">
		<div[d:grid rg:4 mt:6]>
			<p.description>
				"""
				I created a wordpress plugin that provides users with an easy-to-use form on the frontend, seamlessly connected to their backend data. The admin panel for this plug in can be used by admins or administrators of your company's CRM application to view customer information collected from leads submitted via our own custom designed forms.
				"""
			<p.description>
				"""
				The frontend form is made with Imba. The admin panel is made with Svelte. The business logic of the plugin uses Wordpress' REST API to store and retrieve data. The leads from the form are both stored in the
				wordpress database and sent to a moving CRM.  The admin panel is capable of exporting the data in a CSV file, and sending email notifications when new
				leads are submitted. 
				"""
		<a.button.button-small[mt:6 px:12 py:2 pt:3 rd:xl]> "Visit"