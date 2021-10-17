import Swiper, { Navigation, Pagination } from 'swiper'
import 'swiper/css'
import 'swiper/css/navigation'
import 'swiper/css/pagination'
import './dropdown'
import './styles'

let currentSection = ""
let scrollHack = true

tag accordion
	open = false
	def status 
		open ? "skills-open" : "skills-close"

	<self>
		<div.skills-content .{status!} @click=(open = !open)>	
			<slot>

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
	
	def render
		<self [scroll-behavior:smooth] @scroll=scrollActive! [h:100vh of:auto]=scrollHack>  
			# <div[pos:fixed t:0 l:0 c:red]> scrollTop
			<style> "@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap');"
			<header.header .scroll-header=(scrollTop >= 80)>
				<nav.nav.container>
					<a.nav-logo href="#"> "Alexa {currentSection}"
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
								<a.nav-link @click=toggleMenu href="#services">
									<i.uil.nav-icon.uil-briefcase-alt>
									"Services"
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
								<a.home-social-icon>
									<i.uil.uil-linkedin-alt>
								<a.home-social-icon>
									<i.uil.uil-dribbble>
								<a.home-social-icon>
									<i.uil.uil-github-alt>
							<div.home-img [pos:relative]>
								<svg.home-blob viewBox="0 0 200 187" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
									<mask id="mask0" mask-type="alpha">
											<path d="M190.312 36.4879C206.582 62.1187 201.309 102.826 182.328 134.186C163.346 165.547 
													130.807 187.559 100.226 186.353C69.6454 185.297 41.0228 161.023 21.7403 129.362C2.45775 
													97.8511 -7.48481 59.1033 6.67581 34.5279C20.9871 10.1032 59.7028 -0.149132 97.9666 
													0.00163737C136.23 0.303176 174.193 10.857 190.312 36.4879Z" >
										
										<g mask="url(#mask0)">
											<path d="M190.312 36.4879C206.582 62.1187 201.309 102.826 182.328 134.186C163.346 
													165.547 130.807 187.559 100.226 186.353C69.6454 185.297 41.0228 161.023 21.7403 
													129.362C2.45775 97.8511 -7.48481 59.1033 6.67581 34.5279C20.9871 10.1032 59.7028 
													-0.149132 97.9666 0.00163737C136.23 0.303176 174.193 10.857 190.312 36.4879Z" >
											<image.home-blob-img x=12 y=18 href="./perfil.png" >			
							<div.home-data>
								<h1.home-title> "Hello, I'm Alexa"
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
						<img.about-img src="./img/about.jpg">
						<div.about-data>
							<div.about-description>
								"Web developer, with extensive knowledge and years of experience, 
								working in web technologies and Ui / Ux design, delivering quality work."
							<div.about-info>
								<div>
									<span.about-info-title> "5+"
									<span.about-info-name> "Years {<br>} experience"
								<div>
									<span.about-info-title> "5+"
									<span.about-info-name> "Completed {<br>} projects"
								<div>
									<span.about-info-title> "5+"
									<span.about-info-name> "Companies {<br>} worked for"
							<div.about-buttons>
								<a.button.button-flex href="/cv.pdf"> "Download CV"
									<i.uil.uil-download-alt.button-icon>
				
				<section.skills.section#skills>
					<h2.section-title> "Skills"
					<span.section-subtitle> "My technical level"
					<div.skills-container.container.grid>
						<div>
							# Skills 1
							<accordion>	
								<div.skills-header>
									<i.uil.uil-brackets-curly.skills-icon>
									<div>
										<h1.skills-title> "Frontend developer"
										<span.skills-subtitle> "More than 4 years"
									<i.uil.uil-angle-down.skills-arrow>
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
						<div>
							# Skills 2
							<accordion>	
								<div.skills-header>
									<i.uil.uil-server-network.skills-icon>
									<div>
										<h1.skills-title> "Backend Developer"
										<span.skills-subtitle> "More than 4 years"
									<i.uil.uil-angle-down.skills-arrow>
								<div.skills-list.grid>
									<div.skills-data>
										<div.skills-titles>
											<h3.skills-name> "Elixir"
											<span.skills-number> "100%"
										<div.skills-bar>
											<span.skills-percentage>
									<div.skills-data>
										<div.skills-titles>
											<h3.skills-name> "Ruby"
											<span.skills-number> "100%"
										<div.skills-bar>
											<span.skills-percentage>
									<div.skills-data>
										<div.skills-titles>
											<h3.skills-name> "Python"
											<span.skills-number> "100%"
										<div.skills-bar>
											<span.skills-percentage>
									<div.skills-data>
										<div.skills-titles>
											<h3.skills-name> "PHP"
											<span.skills-number> "90%"
										<div.skills-bar>
											<span.skills-percentage[w:90%]>

				<section.qualification.section>
					<h2.section-title> "Qualification"
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
										<h3.qualification-title> "Computer Engineer"
										<span.qualification-subtitle> "Richmond - University"
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
											<i.uil.uil-calendar-alt /> "2014-2016"
								# Qualification 3
								<div.qualification-data>
									<div>
										<h3.qualification-title> "Backend Development"
										<span.qualification-subtitle> "Self-Taught"
										<div.qualification-calendar>
											<i.uil.uil-calendar-alt /> "2016-2019"
									<div>
										<span.qualification-rounder>
										<span.qualification-line>
								# Qualification 4
								<div.qualification-data>
									<div>
									<div>
										<span.qualification-rounder>
									<div>
										<h3.qualification-title> "Phoenix Liveview"
										<span.qualification-subtitle> "Pragmatic Studios"
										<div.qualification-calendar>
											<i.uil.uil-calendar-alt /> "2019-2021"
						# Qualification content 2
							<div.qualification-content#work [d:block]=getCurrentTab('work')>
							# Qualification 1
								<div.qualification-data>
									<div>
										<h3.qualification-title> "Web Developer"
										<span.qualification-subtitle> "Magna Carter Inc"
										<div.qualification-calendar>
											<i.uil.uil-calendar-alt /> "2014-2017"
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
										<h3.qualification-title> "Fullstack Developer"
										<span.qualification-subtitle> "Etherlab"
										<div.qualification-calendar>
											<i.uil.uil-calendar-alt /> "2017-2020"
								# Qualification 3
								<div.qualification-data>
									<div>
										<h3.qualification-title> "Senior Developer"
										<span.qualification-subtitle> "Bagina Pharmaceuticals"
										<div.qualification-calendar>
											<i.uil.uil-calendar-alt /> "2020-"
									<div>
										<span.qualification-rounder>
										# <span.qualification-line>
				
				<section.services.section#services>
					<h2.section-title> "Services"
					<span.section-subtitle> "What I can offer for you"
					<div.services-container.container.grid>
						# Services 1
						<div.services-content>
							<div>
								<i.uil.uil-web-grid.services-icon>
								<h3.services-title> "Ui/Ux {<br>} Designer"
							<dropdown>
								<span.button.button-flex.button-small.button-link.services-button>
									"View More"
									<i.uil.uil-arrow-right.button-icon>
								<div.services-modal slot="dropdown">
									<div.services-modal-content>
										<h4.services-modal-title> "Ui/Ux {<br>} Designer"
										# <i.uil.uil-times.services-modal-close>
										<ul.services-modal-services.grid>
											<li.services-modal-service>
												<i.uil.uil-check-circle.services-modal-icon>
												<p> "I develop the user interface"
											<li.services-modal-service>
												<i.uil.uil-check-circle.services-modal-icon>
												<p> "Web page development"
											<li.services-modal-service>
												<i.uil.uil-check-circle.services-modal-icon>
												<p> "I create the UX elements interactions."
											<li.services-modal-service>
												<i.uil.uil-check-circle.services-modal-icon>
												<p> "I position your company brand."
						# Services 2	
						<div.services-content>
							<div>
								<i.uil.uil-arrow.services-icon>
								<h3.services-title> "Frontend {<br>} Developer"
							<dropdown>
								<span.button.button-flex.button-small.button-link.services-button>
									"View More"
									<i.uil.uil-arrow-right.button-icon>
								<div.services-modal slot="dropdown">
									<div.services-modal-content>
										<h4.services-modal-title> "Frontend {<br>} Developer"
										# <i.uil.uil-times.services-modal-close>
										<ul.services-modal-services.grid>
											<li.services-modal-service>
												<i.uil.uil-check-circle.services-modal-icon>
												<p> "I develop the user interface"
											<li.services-modal-service>
												<i.uil.uil-check-circle.services-modal-icon>
												<p> "Web page development"
											<li.services-modal-service>
												<i.uil.uil-check-circle.services-modal-icon>
												<p> "I create the UX elements interactions."
											<li.services-modal-service>
												<i.uil.uil-check-circle.services-modal-icon>
												<p> "I position your company brand."
						# Services 3
						<div.services-content>
							<div>
								<i.uil.uil-pen.services-icon>
								<h3.services-title> "Branding {<br>} Designer"
							<dropdown>
								<span.button.button-flex.button-small.button-link.services-button>
									"View More"
									<i.uil.uil-arrow-right.button-icon>
								<div.services-modal slot="dropdown">
									<div.services-modal-content>
										<h4.services-modal-title> "Branding {<br>} Designer"
										# <i.uil.uil-times.services-modal-close>
										<ul.services-modal-services.grid>
											<li.services-modal-service>
												<i.uil.uil-check-circle.services-modal-icon>
												<p> "I develop the user interface"
											<li.services-modal-service>
												<i.uil.uil-check-circle.services-modal-icon>
												<p> "Web page development"
											<li.services-modal-service>
												<i.uil.uil-check-circle.services-modal-icon>
												<p> "I create the UX elements interactions."
											<li.services-modal-service>
												<i.uil.uil-check-circle.services-modal-icon>
												<p> "I position your company brand."
													
				<section.portfolio.section#portfolio>
					<h2.section-title> "Portfolio"
					<span.section-subtitle> "Most recent work"
					
					<div.portfolio-container.mySwiper.container.swiper>
						<div.swiper-wrapper>
							# Portfolio 1
							<div.portfolio-content.grid.swiper-slide>
								<img.portfolio-img src="./img/portfolio1.jpg">
								<div.portfolio-data>
									<h3.portfolio-title> "Modern Website"
									<p.portfolio-description>
										"Website adaptable to all devices, with ui components and animated interactions."
									<a.button.button-flex.button-small.portfolio-button href="#"> "Demo"
										<i.uil.uil-arrow-right.button-icon>

							# Portfolio 2
							<div.portfolio-content.grid.swiper-slide>
								<img.portfolio-img src="./img/portfolio2.jpg">
								<div.portfolio-data>
									<h3.portfolio-title> "Brand Design"
									<p.portfolio-description>
										"Website adaptable to all devices, with ui components and animated interactions."
									<a.button.button-flex.button-small.portfolio-button href="#"> "Demo"
										<i.uil.uil-arrow-right.button-icon>

							# Portfolio 3
							<div.portfolio-content.grid.swiper-slide>
								<img.portfolio-img src="./img/portfolio3.jpg">
								<div.portfolio-data>
									<h3.portfolio-title> "Online Store"
									<p.portfolio-description>
										"Website adaptable to all devices, with ui components and animated interactions."
									<a.button.button-flex.button-small.portfolio-button href="#"> "Demo"
										<i.uil.uil-arrow-right.button-icon>
						<div.swiper-button-next>
							<i.uil.uil-angle-right-b.swiper-portfolio-icon>
						<div.swiper-button-prev>
							<i.uil.uil-angle-left-b.swiper-portfolio-icon>
						<div.swiper-pagination>
				
				<section.project.section>
					<div.project-bg>
						<div.project-container.container.grid>
							<div.project-data>
								<h2.project-title> "You have a new project?"
								<p.project-description> "Contact me now and get a 33.3% discount!!!"
								<a.button.button-flex.button-white> "Contact Me"
									<i.uil.uil-message.project-icon.button-icon>
							<img.project-img src="./img/project.png">						

				<section.testimonial.section>
					<h2.section-title> "Testimonial"
					<span.section-subtitle> "My clients are saying"
					<div.container.testimonial-container.swiper>
						<div.swiper-wrapper>
							# Testimonial 1
							<div.testimonial-content.swiper-slide>
								<div.testimonial-data>
									<div.testimonial-header>
										<img.testimonial-img src="./img/testimonial1.jpg">
										<div>
											<h3.testimonial-name> "Sarah Smith"	
											<span.testimonial-client> "Client"
									<div>
										<i.uil.uil-star.testimonial-icon-star>
										<i.uil.uil-star.testimonial-icon-star>
										<i.uil.uil-star.testimonial-icon-star>
										<i.uil.uil-star.testimonial-icon-star>
										<i.uil.uil-star.testimonial-icon-star>
								<p.testimonial-description> 
									"I got a good impression, she worked on my project with all
									 the possible quality and attention and support possible for
									 24 hours a day."
							# Testimonial 2
							<div.testimonial-content.swiper-slide>
								<div.testimonial-data>
									<div.testimonial-header>
										<img.testimonial-img src="./img/testimonial2.jpg">
										<div>
											<h3.testimonial-name> "Matt Robinson"	
											<span.testimonial-client> "Client"
									<div>
										<i.uil.uil-star.testimonial-icon-star>
										<i.uil.uil-star.testimonial-icon-star>
										<i.uil.uil-star.testimonial-icon-star>
										<i.uil.uil-star.testimonial-icon-star>
										<i.uil.uil-star.testimonial-icon-star>
								<p.testimonial-description> 
									"I got a good impression, she worked on my project with all
									 the possible quality and attention and support possible for
									 24 hours a day."
							# Testimonial 3
							<div.testimonial-content.swiper-slide>
								<div.testimonial-data>
									<div.testimonial-header>
										<img.testimonial-img src="./img/testimonial3.jpg">
										<div>
											<h3.testimonial-name> "Raul Harris"	
											<span.testimonial-client> "Client"
									<div>
										<i.uil.uil-star.testimonial-icon-star>
										<i.uil.uil-star.testimonial-icon-star>
										<i.uil.uil-star.testimonial-icon-star>
										<i.uil.uil-star.testimonial-icon-star>
										<i.uil.uil-star.testimonial-icon-star>
								<p.testimonial-description> 
									"I got a good impression, she worked on my project with all
									 the possible quality and attention and support possible for
									 24 hours a day."
						<div.swiper-pagination-testimonial[pos:absolute b:0]>

				<section.contact.section#contact>
					<h2.section-title> "Contact Me"
					<span.section-subtitle> "Get in touch"
					<div.contact-container.container.grid>
						<div>

							<div.contact-information>
								<i.uil.uil-phone.contact-icon>
								<div>
									<h3.contact-title> "Call me"
									<span.contact-subtitle> "777-8675-309"

							<div.contact-information>
								<i.uil.uil-envelope.contact-icon>
								<div>
									<h3.contact-title> "Email"
									<span.contact-subtitle> "alexandra@gmail.com"

							<div.contact-information>
								<i.uil.uil-map-marker.contact-icon>
								<div>
									<h3.contact-title> "Location"
									<span.contact-subtitle> "Gran Tartary- Providence of Anian"
						<form.contact-form.grid>
							<div.contact-inputs.grid>
								<div.contact-content>
									<label.contact-label> "Name"
									<input.contact-input type="text">
								<div.contact-content>
									<label.contact-label> "Email"
									<input.contact-input type="email">
							<div.contact-content>
								<label.contact-label> "Subject"
								<input.contact-input type="text">
							<div.contact-content>
								<label.contact-label> "Message"
								<textarea.contact-input rows=7>
							<div>
								<a.button.button-flex> "Send Message"
									<i.uil.uil-message.button-icon>

			<footer.footer>
				<div.footer-bg>
					<div.footer-container.container.grid>
						<div>
							<h1.footer-title> "Alexa"
							<span.footer-subtitle> "Fullstack Developer"
						<ul.footer-links>
							<li>
								<a.footer-link href="#services"> "Services"
							<li>
								<a.footer-link href="#portfolio"> "Portfolio"
							<li>
								<a.footer-link href="#contact"> "Contact"
						<div.footer-socials>
							<a.footer-social href="#"> 
								<i.uil.uil-facebook-f>
							<a.footer-social href="#"> 
								<i.uil.uil-instagram>
							<a.footer-social href="#"> 
								<i.uil.uil-twitter-alt>
					<p.footer-copy> "© Thoth. All rights reserved"

					<a.scrollup#scroll-up 
					[pos:fixed r:1rem b:-20% zi:200 bgc:$color-1 o:.8 p:.3rem rd:.4rem
					c@hover:$color-1-alt tween:all .4s]
					[b:5rem]=(scrollTop >= 560)
					 href="#home">
						<i.uil.uil-arrow-up.scrollup-icon[fs:1.5rem c:white]>

imba.mount <app>