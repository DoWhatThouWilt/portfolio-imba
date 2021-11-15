import Swiper, { Navigation, Pagination } from 'swiper'
import 'swiper/css'
import 'swiper/css/navigation'
import 'swiper/css/pagination'
import './dropdown'
import './modal'
import './styles'
import './masonry'
# import './slider'
import './flickity'

let currentSection = ""
let scrollHack = false

tag accordion
	open = false
	def status 
		open ? "skills-open" : "skills-close"

	<self>
		<div.skills-content .{status!} @click=(open = !open)>	
			<slot>

# tag master
# 	<self>
# 		<app route='/$'>

tag app
	swiper
	swiperTestimonial
	show-menu = false
	currentTheme
	
	def mount
		let storedTheme = window.localStorage.getItem('theme') # || window.matchMedia("(prefers-color-scheme: dark)").matches ? "dark" : "light"
		if storedTheme
			document.documentElement.setAttribute('data-theme', storedTheme)
			currentTheme = storedTheme
		else
			currentTheme = 'light'
			document.documentElement.setAttribute('data-theme', currentTheme)
		console.log("mount: current theme is {currentTheme}")

		setInterval(&, 15) do
			imba.commit!

		Swiper.use([Navigation, Pagination])
		swiper = new Swiper('.mySwiper', 
			loop: true
			cssMode: true
			navigation: 
				nextEl: ".swiper-button-next"
				prevEl: ".swiper-button-prev"
			pagination: 
				el: ".swiper-pagination"
				clickable: true
			on:
				init: do() console.log('initialized')
		)
		swiperTestimonial = new Swiper('.testimonial-container', 
			loop: true
			grabCursor: true
			spaceBetween: 48
			pagination: 
				el: ".swiper-pagination-testimonial"
				clickable: true
				dynamicBullets: true
			breakpoints:
				568: 
					slidesPerView: 2
		)
	

	def toggleTheme
		currentTheme = document.documentElement.getAttribute('data-theme')
		let targetTheme = 'light'

		if currentTheme === 'light'
			targetTheme = 'dark'
		
		document.documentElement.setAttribute('data-theme', targetTheme)
		window.localStorage.setItem('theme', targetTheme)
		currentTheme = targetTheme
	

	def scrollActive
		let sections = document.querySelectorAll('section[id]')
		# $main.flags.remove
		
		sections.forEach(do(section)
			let sectionHeight = section.offsetHeight
			let sectionTop = section.offsetTop - 50
			let sectionId = section.getAttribute('id')
			
			if scrollTop > sectionTop && scrollTop <= sectionTop + sectionHeight
				document.querySelector(".nav-menu a[href*={sectionId}]").flags.add("nav-active")
			else
				document.querySelector(".nav-menu a[href*={sectionId}]").flags.remove("nav-active")
		)

	
	def toggleMenu
		show-menu = !show-menu
	
	currentTab = "education"
	
	def getCurrentTab(selected)
		currentTab == selected
	
	def copy
		const input = document.getElementById('copy')
		input.select!
		document.execCommand('copy')
		input.blur!
	
	def render
		<self [scroll-behavior:smooth] @scroll=scrollActive! [h:100vh of:auto]=scrollHack>  
			# <div[mt:20]> "{window.innerWidth} {document.body.offsetWidth}"
			<style> "@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap');"
			<header$header.header .scroll-header=(scrollTop >= 80)>
				<nav.nav.container>
					<a.nav-logo href="#"> "Chenaniah"
					<div.nav-menu#nav-menu .show-menu=show-menu>
						<ul.nav-list.grid>
							<li.nav-item>
								<a.nav-link @click=toggleMenu href="#home">
									<i.uil.nav-icon.uil-estate>
									"Home"
							<li.nav-item>
								<a.nav-link @click=toggleMenu href="#about">
									<i.uil.nav-icon.uil-user> 
									"About"
							<li.nav-item>
								<a.nav-link @click=toggleMenu href="#skills">
									<i.uil.nav-icon.uil-file-alt>
									"Skills"
							<li.nav-item>
								<a.nav-link @click=toggleMenu href="#qualifications">
									<i.uil.nav-icon.uil-briefcase-alt>
									"Qualifications"
							<li.nav-item>
								<a.nav-link @click=toggleMenu href="#portfolio">
									<i.uil.nav-icon.uil-scenery>
									"Portfolio"
							<li.nav-item>
								<a.nav-link @click=toggleMenu href="#contact">
									<i.uil.nav-icon.uil-message>
									"Contact"
						<i.uil.uil-times.nav-close @click=toggleMenu>
					<div.nav-btns>
						<i.uil.uil-{currentTheme === 'light' ? 'sun' : 'moon'}.change-theme @click=toggleTheme!>
						<div.nav-toggle @click=toggleMenu>
							<i.uil.uil-apps.nav-icon>

			<div.main>
				<section.home.section#home>
					<div.home-container.container.grid>
						<div.home-content.grid>
							<div.home-social>
								# <a.home-social-icon>
								# 	<i.uil.uil-linkedin-alt>
								<a.home-social-icon href="https://codepen.io/loveunderwill">
									<span.iconify data-icon="akar-icons:codepen-fill">
								<a.home-social-icon href="https://github.com/DoWhatThouWilt/">
									<i.uil.uil-github-alt>
							<div.home-img>
								<svg.home-blob viewBox="0 0 200 187" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
									<defs> 
										<linearGradient id="sw-gradient" x1="0" x2="1" y1="1" y2="0">
											<stop id="stop1" stop-color="rgba(84.337, 72.073, 255, 1)" offset="0%">
											<stop id="stop2" stop-color="rgba(255, 109.475, 54.797, 1)" offset="100%">
									<mask id="mask0" mask-type="alpha">
											<path d="M190.312 36.4879C206.582 62.1187 201.309 102.826 182.328 134.186C163.346 165.547 
													130.807 187.559 100.226 186.353C69.6454 185.297 41.0228 161.023 21.7403 129.362C2.45775 
													97.8511 -7.48481 59.1033 6.67581 34.5279C20.9871 10.1032 59.7028 -0.149132 97.9666 
													0.00163737C136.23 0.303176 174.193 10.857 190.312 36.4879Z" >
										
										<g mask="url(#mask0)">
											<path fill="url(#sw-gradient)" d="M190.312 36.4879C206.582 62.1187 201.309 102.826 182.328 134.186C163.346 
													165.547 130.807 187.559 100.226 186.353C69.6454 185.297 41.0228 161.023 21.7403 
													129.362C2.45775 97.8511 -7.48481 59.1033 6.67581 34.5279C20.9871 10.1032 59.7028 
													-0.149132 97.9666 0.00163737C136.23 0.303176 174.193 10.857 190.312 36.4879Z" >
											<image.home-blob-img[w:225px] x=-5 y=0 href="./placeholder.png" > # x=12 y=18
							<div.home-data>
								<h1.home-title> "I'm Chenaniah"
								<h3.home-subtitle> "Fullstack developer"
								<p.home-description> "High level experience in web design and development knowledge, producing quality work."
								<a.button.button-flex href="#contact"> "Contact me" 
									<i.uil.uil-message.button-icon>
						<div.home-scroll>
							<a.home-scroll-button.button-flex>
								<i.uil.uil-mouse-alt.home-scroll-mouse>
								<span.home-scroll-name> "Scroll down"
								<i.uil.uil-arrow-down.button-icon.home-scroll-arrow>

				<section.about.section#about>	
					<h2.section-title> "About Me"
					<span.section-subtitle> "My Introduction"
					<div.about-container.container.grid>
						<img.about-img [w:400px] src="./img/javascript_certificate.png">
						<div.about-data>
							<div.about-description[mb:4]>
								"""I'm a Web developer, with extensive knowledge and years of experience, 
								working in web technologies and Ui / Ux design, delivering quality work.	
								"""
							<div.about-description>
								"""
								I have great versitility when it comes to picking up new skills. I learn quickly because I have knowledge of the
								common foundational concepts shared among programming languages.
								"""
							<div.about-buttons>
								<a.button.button-flex href="https://www.freecodecamp.org/certification/dowhatthouwilt/javascript-algorithms-and-data-structures"> "View Certificate"
									<i.uil.uil-download-alt.button-icon>
				
				<section.skills.section#skills>
					<h2.section-title> "Skills"
					<span.section-subtitle> "My technical level"
					<div.skills-container.container.grid>
						<div>
							<masonry>	
						<div[d:flex fld:column rg:10 mt:0 @350:10]>
							# Skills 1
							<accordion>	
								<div.skills-header[mb:4]>
									<i.uil.uil-brackets-curly.skills-icon>
									<div>
										<h1.skills-title> "Frontend developer"
										<span.skills-subtitle> "More than 3 years"
									<i.uil.uil-angle-down.skills-arrow>
								<div[ml:11 mb:2]>
									"Expertise in HTML, CSS, and Javascript, Experience with the frameworks of
									Svelte, Vue, React, and Imba"
								<div.skills-list.grid>
									<div.skills-data>
										<div.skills-titles>
											<h3.skills-name> "HTML"
											<span.skills-number> "100%"
										<div.skills-bar>
											<span.skills-percentage>
									<div.skills-data>
										<div.skills-titles>
											<h3.skills-name> "CSS"
											<span.skills-number> "100%"
										<div.skills-bar>
											<span.skills-percentage>
									<div.skills-data>
										<div.skills-titles>
											<h3.skills-name> "JavaScript"
											<span.skills-number> "100%"
										<div.skills-bar>
											<span.skills-percentage>
									<div.skills-data>
										<div.skills-titles>
											<h3.skills-name> "Svelte"
											<span.skills-number> "100%"
										<div.skills-bar>
											<span.skills-percentage>
							# Skills 2
							<accordion>	
								<div.skills-header[mb:4]>
									<i.uil.uil-server-network.skills-icon>
									<div>
										<h1.skills-title> "Backend Developer"
										<span.skills-subtitle> "More than 4 years"
									<i.uil.uil-angle-down.skills-arrow>
								<div[ml:11 mb:2]>
									"Experience in Elixir, Ruby, Python, PHP. I have worked within the
									frameworks of Phoenix/Phoenix Liveview, Ruby on Rails, Django, and
									Wordpress"
								<div.skills-list.grid>
									<div.skills-data>
										<div.skills-titles>
											<h3.skills-name> "Elixir"
											<span.skills-number> "70%"
										<div.skills-bar>
											<span.skills-percentage[w:70%]>
									<div.skills-data>
										<div.skills-titles>
											<h3.skills-name> "Ruby"
											<span.skills-number> "60%"
										<div.skills-bar>
											<span.skills-percentage[w:60%]>
									<div.skills-data>
										<div.skills-titles>
											<h3.skills-name> "Python"
											<span.skills-number> "30%"
										<div.skills-bar>
											<span.skills-percentage[w:30%]>
									<div.skills-data>
										<div.skills-titles>
											<h3.skills-name> "PHP"
											<span.skills-number> "40%"
										<div.skills-bar>
											<span.skills-percentage[w:40%]>


				<section.qualification.section#qualifications>
					<h2.section-title> "Qualifications"
					<span.section-subtitle> "My personal journey"
					<div.qualification-container.container>
						<div.qualification-tabs>
							<div.qualification-button.button-flex @click=(currentTab = 'education')
							[c:$color-1]=getCurrentTab('education')>
								<i.uil.uil-graduation-cap.qualification-icon /> "Education"
							<div.qualification-button.button-flex @click=(currentTab = 'work')
							[c:$color-1]=getCurrentTab('work')>
								<i.uil.uil-briefcase-alt.qualification-icon /> "Work"
						<div.qualification-sections>
						# Qualification content 1
							<div.qualification-content#education [d:block]=getCurrentTab('education')>
							# Qualification 1
								<div.qualification-data>
									<div>
										<h3.qualification-title> "Bachelor of Science in Biology"
										<span.qualification-subtitle> "Virginia Commonwealth University"
										<div.qualification-calendar>
											<i.uil.uil-calendar-alt /> "2010-2014"
									<div>
										<span.qualification-rounder>
										<span.qualification-line>
								# Qualification 2
								<div.qualification-data>
									<div>
									<div>
										<span.qualification-rounder>
										<span.qualification-line>
									<div>
										<h3.qualification-title> "Web Fundamentals"
										<span.qualification-subtitle> "FreeCodeCamp"
										<div.qualification-calendar>
											<i.uil.uil-calendar-alt /> "2016-2019"
								# Qualification 3
								<div.qualification-data>
									<div>
										<h3.qualification-title> "Fullstack Development"
										<span.qualification-subtitle> "Self-Study"
										<div.qualification-calendar>
											<i.uil.uil-calendar-alt /> "2019-Now"
									<div>
										<span.qualification-rounder>
									# 	<span.qualification-line>
								# Qualification 4
								# <div.qualification-data>
								# 	<div>
								# 	<div>
								# 		<span.qualification-rounder>
								# 	<div>
								# 		<h3.qualification-title> "Phoenix Liveview"
								# 		<span.qualification-subtitle> "Pragmatic Studios"
								# 		<div.qualification-calendar>
								# 			<i.uil.uil-calendar-alt /> "2019-2021"
						# Qualification content 2
							<div.qualification-content#work [d:block]=getCurrentTab('work')>
							# Qualification 1
								<div.qualification-data>
									<div>
										<h3.qualification-title> "Pharmacy Technician"
										<span.qualification-subtitle> "Walgreens"
										<div.qualification-calendar>
											<i.uil.uil-calendar-alt /> "2014-2016"
									<div>
										<span.qualification-rounder>
										<span.qualification-line>
								# Qualification 2
								<div.qualification-data>
									<div>
									<div>
										<span.qualification-rounder>
										# <span.qualification-line>
									<div>
										<h3.qualification-title> "Production Pharmacy Technician"
										<span.qualification-subtitle> "Loudoun Pharmacy"
										<div.qualification-calendar>
											<i.uil.uil-calendar-alt /> "2016-2021"
								# Qualification 3
								# <div.qualification-data>
								# 	<div>
								# 		<h3.qualification-title> "Senior Developer"
								# 		<span.qualification-subtitle> "Bagina Pharmaceuticals"
								# 		<div.qualification-calendar>
								# 			<i.uil.uil-calendar-alt /> "2020-"
								# 	<div>
								# 		<span.qualification-rounder>
								# 			<span.qualification-line>
				
				<section.portfolio.section#portfolio>
					<h2.section-title> "Portfolio"
					<span.section-subtitle> "Most recent work"
					
					<div.portfolio-container.container>
							# Portfolio 1
							<div.portfolio-content.grid>
								<img.portfolio-img src="./img/moving-form.png">
								<div.portfolio-data>
									<h3.portfolio-title> "Multi-Step Moving Form"
									<p.portfolio-description>
										"A dynamic form tailored to the needs of moving customers"
									<modal header=$header>
										<a.button.button-flex.button-small.portfolio-button> "More Details"
											<i.uil.uil-arrow-right.button-icon>
										<div slot="dropdown">
											<flickity>
												<div[py:4 bdb:black/8 1px solid]>
													<h2[fs:$h1 fw:600 c:$title-color]> "Multi-Step Moving Form"
													<p[mt:1 fs:$sm-fs]> "A dynamic form tailored to the needs of moving customers"
												<p[tt:uppercase fs:$sm-fs my:4]> "tech"
												<div[d:flex cg:4].tech> 
													<div.tech-item> "Imba"
													<div.tech-item> "Robot3"
												<div.carousel[mt:4]>
													<div.carousel-cell>
														<img src="./img/movingform1.png">
													<div.carousel-cell>
														<img src="./img/movingform2.png">
													<div.carousel-cell>
														<img src="./img/movingform3.png">
												<div[d:grid rg:4 mt:6]>
													<p.description>
														"""
														The form I created for moving companies is a multi-step process that takes
														 the necessary customer information and inventory of objects needing moved. 
														 It would collect this data about where they need their items moved to ensures
														  movers will have all required knowledge before performing job smoothly! 
														"""
													<p.description>
														"""
														 First off you'll need your basic contact details like name or phone number;
														then more specific stuff about where things are going - how many rooms does this move
														 include? What type if furniture do we have in each space? The form presents a 
														 summary of the furniture items and boxes, allowing customers to make changes before 
														 submitting their information.
														"""
												<div[d:hflex cg:4]>
													<a.button.button-small[mt:6 px:12 py:2 pt:3 rd:xl] href="https://multi-page-moving-form.netlify.app/"> "Demo"
													<a.button.button-small[mt:6 px:12 py:2 pt:3 rd:xl] href="https://github.com/DoWhatThouWilt/moving-form"> "Github"

					
							# Portfolio 2
							<div.portfolio-content.grid>
								<img.portfolio-img src="./img/formine-preview.png">
								<div.portfolio-data>
									<h3.portfolio-title> "Moving Leads Form"
									<p.portfolio-description>
										"A plugin that provides the first essential point of contact for moving customers interacting with businesses
										 which integrates with the WordPress CMS"
									<modal header=$header>
										<a.button.button-flex.button-small.portfolio-button> "More Details"
											<i.uil.uil-arrow-right.button-icon>
										<div slot="dropdown">
											<flickity>
												<div[py:4 bdb:black/8 1px solid]>
													<h2[fs:$h1 fw:600 c:$title-color]> "Moving Leads Form"
													<p[mt:1 fs:$sm-fs]> "A dynamic form tailored to the needs of moving customers"
												<p[tt:uppercase fs:$sm-fs my:4]> "tech"
												<div[d:flex cg:4].tech> 
													<div> "Wordpress"
													<div> "PHP"
													<div> "Tailwind CSS"
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
														The frontend form is made with Imba. The admin panel is made with Svelte and Tailwind CSS. The business logic of the plugin uses Wordpress' REST API to store and retrieve data. The leads from the form are both stored in the
														wordpress database and sent to an external moving CRM.  The admin panel is capable of exporting the data in a CSV file, and sending email notifications when new
														leads are submitted. 
														"""
												<a.button.button-small[mt:6 px:12 py:2 pt:3 rd:xl] href="https://gitfront.io/r/user-2928217/2401f126eaf321145ac9ac24bb98de28e95b094c/moving-leads-form/"> "Source Code"

							# Portfolio 3
							<div.portfolio-content.grid>
								<img.portfolio-img src="./img/todo.png">
								<div.portfolio-data>
									<h3.portfolio-title> "Moving Day Todo-List"
									<p.portfolio-description>
										"A fundamental exercise created with Svelte and Tailwind CSS on the frontend, and a Elixir/Phoenix REST API on the backend with a PostgreSQL database."
									<a.button.button-flex.button-small.portfolio-button href="https://moving-todo.netlify.app/"> "Demo"
										<i.uil.uil-arrow-right.button-icon>
				
				<section.contact.section#contact>
					<h2.section-title> "Contact Me"
					<span.section-subtitle> "Get in touch"
					<div.container[d:grid rg:6 cg:10 gaf:row @568:column ai:center jc:center]> # [d:flex fld:column @568:row rg:4 jc:space-around ai:center]
						# <div>

						<div.contact-information>
							<i.uil.uil-phone.contact-icon>
							<div>
								<h3.contact-title> "Call or Text me"
								<span.contact-subtitle> "703-659-5116"

						<div.contact-information.copy
						[cursor:pointer] @click.flag('display').wait(1s)=copy>
							<i.uil.uil-envelope.contact-icon>
							<div>
								<h3.contact-title> "Email"
								# <span.contact-subtitle> "qhorizon@gmail.com"
								<input#copy[bgc:transparent bd:none c:$text-color-light fs:$sm-fs outline:none]
								 value="qhorizon@gmail.com"
								.contract-subtitle readOnly>

						<a.contact-information href="https://github.com/DoWhatThouWilt/">
							<i.uil.uil-github-alt.contact-icon>
							<div>
								<h3.contact-title> "Github"
								<span.contact-subtitle> "DoWhatThouWilt"

			<footer.footer>
				<div.footer-bg>
					<div.footer-container.container.grid>
						<div>
							<h1.footer-title> "Chenaniah"
							<span.footer-subtitle> "Fullstack Developer"
						<ul.footer-links>
							<li>
								<a.footer-link href="#about"> "About"
							<li>
								<a.footer-link href="#skills"> "Skills"
							<li>
								<a.footer-link href="#qualifications"> "Qualifications"
							<li>
								<a.footer-link href="#portfolio"> "Portfolio"
							<li>
								<a.footer-link href="#contact"> "Contact"
						<div.footer-sociallz>
							<a.footer-socialz href="https://github.com/DoWhatThouWilt/"> 
								<i.uil.uil-github-alt>
							<a.footer-socialz href="https://codepen.io/loveunderwill"> 
								<span.iconify data-icon="akar-icons:codepen-fill">
					<p.footer-copy> "© Chenaniah. All rights reserved"

					<a.scrollup#scroll-up 
					[pos:fixed r:1rem b:-20% zi:200 bgc:$color-1 o:.8 p:.3rem rd:.4rem
					c@hover:$color-1-alt tween:all .4s]
					[b:5rem]=(scrollTop >= 560)
					 href="#home">
						<i.uil.uil-arrow-up.scrollup-icon[fs:1.5rem c:white]>

imba.mount <app>