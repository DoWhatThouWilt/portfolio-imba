global css
	@root[data-theme="dark"]
		$color-1-second: hsl($hue-color, 30%, 8%)	
		$title-color: hsl($hue-color, 8%, 95%)	
		$text-color: hsl($hue-color, 8%, 75%)	
		$input-color: hsl($hue-color, 29%, 16%)	
		$body-color: hsl($hue-color, 28%, 12%)	
		$container-color: hsl($hue-color, 29%, 16%)
		$scroll-bar-color: hsl($hue-color, 12%, 48%)
		$scroll-thumb-color: hsl($hue-color, 12%, 33%) 

	
	@root[data-theme="light"]
		$color-1-second: hsl($hue-color, 69%, 61%)	
		$title-color: hsl($hue-color, 8%, 15%)	
		$text-color: hsl($hue-color, 8%, 45%)	
		$input-color: hsl($hue-color, 70%, 96%)	
		$body-color: hsl($hue-color, 60%, 99%)	
		$container-color: white

	@root
		# Button Dark/Light
		.nav-btns d:flex ai:center	
		.change-theme fs:1.25rem c:$title-color mr:4 cursor:pointer
			@hover c:$color-1
		
		# Base
		scroll-behavior:smooth
		fs:16px
		$header-height: 3rem
		$hue-color: 255
		$color-1: hsl($hue-color, 69%, 61%)	
		$color-1-second: hsl($hue-color, 69%, 61%)	
		$color-1-alt: hsl($hue-color, 57%, 53%)	
		$color-1-lighter: hsl($hue-color, 92%, 85%)	
		$title-color: hsl($hue-color, 8%, 15%)	
		$text-color: hsl($hue-color, 8%, 45%)	
		$text-color-light: hsl($hue-color, 8%, 65%)	
		$input-color: hsl($hue-color, 70%, 96%)	
		$body-color: hsl($hue-color, 60%, 99%)	
		$container-color: white
		$scroll-bar-color: hsl($hue-color, 12%, 99%) 
		$scroll-thumb-color: hsl($hue-color, 12%, 80%) 

		$lg-fs: 2rem
		$h1: 1.5rem
		$h2: 1.25rem
		$h3: 1.125rem
		$normal-fs: .938rem
		$sm-fs: .813rem
		$xs-fs: .75rem
		
		@968
			$lg-fs: 3rem
			$h1: 2.25rem
			$h2: 1.5rem
			$h3: 1.25rem
			$normal-fs: 1rem
			$sm-fs: .875rem
			$xs-fs: .813rem

		* box-sizing:border-box p:0 m:0

		body 
			ff: 'Poppins', sans-serif
			m:0 0 $header-height 0
			fs: $normal-fs
			bgc: $body-color
			c: $text-color
			tween: colors 0.3s
		
		h1,h2,h3,h4 c:$title-color fw:600
		ul list-style:none
		a td:none
		img max-width:100% h:auto
		
		.section p:2rem 0 4rem
		.section-title fs:$h1
		.section-subtitle d:block fs:$sm-fs mb:12
		.section-title,.section-subtitle ta:center

		# Layout
		.container max-width:768px mx:6
		.grid
			d: grid
			g: 1.5rem
		.header
			w: 100%
			pos:fixed
			b:0
			l:0
			zi:100
			bgc:$body-color
			
		# Navigation
		.nav
			max-width:968px
			h:$header-height
			d:flex
			jc:space-between
			ai:center
			py:2
		.nav-logo, .nav-toggle c:$title-color fw:500
		.nav-logo@hover,.nav-toggle@hover c:$color-1
		.nav-toggle fs:1.1rem cursor:pointer
		@!767
			.nav-menu
				pos:fixed
				b:-100%
				l:0
				w:100%
				bgc:$body-color
				p:2rem 1.5rem 4rem	
				shadow:0 -1px 4px rgba(0,0,0,.15)
				rd:1.5rem 1.5rem 0 0
				tween:bottom 0.3s
		.nav-list gtc:repeat(3, 1fr) g:2rem
		.nav-link
			d:flex
			fld:column
			ai:center
			fs:$sm-fs
			fw:500
			c:$title-color
		.nav-link@hover,.nav-close@hover c:$color-1
		.nav-icon fs:1.2rem
		.nav-close
			pos:absolute 
			r:1.3rem 
			b:.5rem 
			fs:1.5rem
			cursor:pointer
			c:$color-1
		.show-menu b:0
		.nav-active c:$color-1
		.scroll-header shadow:0 -1px 4px black/15
	

		# Home
		.home-container g:1rem
		.home-content gtc:.5fr 3fr pt:3.5rem ai:center
		.home-social d:grid gtc:max-content rg:1.5rem
		.home-social-icon fs:1.25rem c:$color-1
		.home-social-icon@hover c:$color-1-alt
		.home-blob w:200px fill:$color-1
		.home-blob-img w:170px
		.home-data gcs:1 gce:3
		.home-title fs:$lg-fs
		.home-subtitle fs:$h3 c:$text-color fw:500 mb:3
		.home-description mb:8
		.home-scroll d:none
		.home-scroll-button c:$color-1 tween:transform 0.3s cursor:pointer
		.home-scroll-button@hover transform:translateY(.25rem)
		.home-scroll-mouse fs:2rem
		.home-scroll-name fs:$sm-fs c:$title-color fw:500 mr:1
		.home-scroll-arrow fs:1.25rem
		

		# Buttons
		.button d:inline-block bgc:$color-1 c:white p:4 rd:.5rem fw:500 cursor:pointer
		.button@hover bgc:$color-1-alt
		.button-icon fs:1.25rem ml:2 tween:transform .3s
		.button-white bgc:white c:$color-1 tween:colors .3s
			@hover c:white bgc:$color-1
		.button-flex d:inline-flex ai:center
		.button-small p:.75rem 1rem
		.button-link p:0 bg:transparent c:$color-1 
			@hover bgc:transparent c:$color-1-alt
		

		# About
		.about-img w:200px rd:.5rem js:center ai:center
		.about-description ta:center mb:10
		.about-info d:flex jc:space-evenly mb:10
		.about-info-name fs:$sm-fs
		.about-info-title fs:$h2 fw:600 c:$title-color
		.about-info-title,.about-info-name d:block ta:center
		.about-buttons d:flex jc:center
		

		# Skills
		.skills-container rg:0	
		.skills-header d:flex ai:center mb:10 cursor:pointer
		.skills-icon, .skills-arrow fs:2rem c:$color-1
		.skills-icon mr:3
		.skills-title fs:$h3
		.skills-subtitle fs:$sm-fs c:$text-color-light
		.skills-arrow ml:auto tween: all .4s
		.skills-list rg:1.5rem pl:2.7rem tween:height 0.3s
		.skills-titles d:flex jc:space-between mb:1 
		.skills-name fs:$normal-font-size fw:500
		.skills-bar,.skills-percentage h:5px rd:.25rem
		.skills-bar bgc:$color-1-lighter
		.skills-percentage d:block bgc:$color-1
		.skills-close .skills-list h:0 of:hidden
		.skills-open .skills-list h:200px mb:10
		.skills-open .skills-arrow transform:rotate(-180deg)
		
		# Qualification
		.qualification-tabs d:flex jc:space-evenly mb:8
		.qualification-button fs:$h3 fw:500 cursor:pointer
		.qualification-button@hover c:$color-1
		.qualification-icon fs:1.8rem mr:1
		.qualification-data d:grid gtc:1fr max-content 1fr cg:1.5rem
		.qualification-title fs:$normal-fs fw:500
		.qualification-subtitle d:inline-block fs:$sm-fs mb:4 
		.qualification-calendar fs:$xs-fs c:$text-color-light
		.qualification-rounder d:inline-block w:13px h:13px bgc:$color-1 rd:50%
		.qualification-line d:block w:1px h:100% bgc:$color-1 transform:translate(6px, -7px)
		.qualification-content d:none
		
		# Services
		.services-container g:1.5rem gtc: repeat(2, 1fr)
		.services-content
			pos:relative bgc:$container-color p:3.5rem .5rem 1.25rem 1.5rem rd:.25rem
			shadow:0 2px 4px black/15 tween:styles .3s 
			@hover shadow:0 4px 8px black/15
		.services-icon d:block fs:1.5rem c:$color-1 mb:4
		.services-title fs:h3 mb:4 fw:500
		.services-button cursor:pointer fs:$sm-fs
			@hover .button-icon transform: translateX(.25rem)	
		.services-modal-content bgc:$container-color p:1.5rem rd:.5rem w@!480:88vw
		.services-modal-services rg:1rem
		.services-modal-service d:flex
		.services-modal-title fs:$h3 fw:500 mb:1.5rem
		.services-modal-close pos:absolute t:1rem r:1rem c:$color-1 cursor:pointer
		.services-modal-icon c:$color-1 mr:1
		
		# Portfolio
		.portfolio-container of:initial
		.portfolio-content p:1.5rem
		.portfolio-img w:256px rd:.5rem js:center
		.portfolio-title fs:$h3 mb:2
		.portfolio-description mb:3
		.portfolio-button@hover .button-icon transform:translateX(.25rem)
		.swiper-wrapper h:auto
		.swiper-button-prev@after, .swiper-button-next@after content:''
		.swiper-portfolio-icon fs:2rem c:$color-1
		.swiper-button-prev l:-.5rem
		.swiper-button-next r:-.5rem
		.swiper-horizontal > .swiper-pagination-bullets b:-1rem
		.swiper-pagination-bullet-active bgc:$color-1
		.swiper-button-prev, .swiper-button-next, .swiper-pagination-bullet outline:none
		
		# Project In Mind
		.project ta:center
		.project-bg bgc:$color-1 pt:3rem
		.project-title fs:$h2 mb:3
		.project-description mb:1.5
		.project-title, .project-description c:white
		.project-img w:232px js:center
		
		# Testimonial
		.testimonial-data, .testimonial-header d:flex
		.testimonial-data jc:space-between mb:4
		.testimonial-img w:60px h:60px rd:50% mr:3
		.testimonial-name fs:$h3 fw:500
		.testimonial-client fs:$sm-fs c:$text-color-light
		.testimonial-icon-star c:$color-1-second ml:1
		.testimonial-description mb:6
		# .swiper-pagination-testimonial b:0
		
		# Contact Me
		.contact-container rg:3rem	
		.contact-information d:flex mb:8
		.contact-icon fs:2rem c:$color-1 mr:3
		.contact-title fs:$h3 fw:500
		.contact-subtitle fs:$sm-fs c:$text-color-light
		.contact-content bgc:$input-color rd:.5rem pt:3 px:4 pb:1
		.contact-input
			w:100% bgc:$input-color c:$text-color fs:$normal-fs bd:none
			outline:none pt:1 pr:2 pb:2 pl:0
		.contact-label
			fs:$xs-fs c:$title-color
		
		# Footer
		.footer pt:2rem
		.footer-container rg:3.5rem
		.footer-bg bgc:$color-1-second pt:2rem pb:3rem
		.footer-title fs:$h1 mb:1
		.footer-subtitle fs:$sm-fs
		.footer-links d:flex fld:column rg:1.5rem
		.footer-link c@hover:$color-1-lighter
		.footer-social fs:1.25rem mr:6 c@hover:$color-1-lighter
		.footer-copy fs:$xs-fs ta:center c:$text-color-light mt:12
		.footer-title, .footer-subtitle, .footer-link, .footer-social c:white
		
		# Scroll Bar
		::-webkit-scrollbar w:.6rem bgc:$scroll-bar-color rd:.5rem
		::-webkit-scrollbar-thumb bgc:$scroll-thumb-color rd:.5rem bgc@hover:$text-color-light
		
		# Media Queries
		
		@!350
			.container mx:4
			.nav-menu px:.25rem pt:2rem py:4rem
			.nav-list cg:0
			.home-content gtc:.25fr 3fr
			.home-blob w:180px
			.skills-title fs:$normal-fs
			.qualification-data g:.5rem
			.services-container gtc:max-content jc:center
			.services-content pr:3.5rem
			# .services-modal px:.5rem
			.project-img w:200px
			.testimonial-data,.testimonial-header fld:column ai:center 
			.testimonial-img mr:0 mb:1
			.testimonial-data,.testimonial-description ta:center
		
		@568
			.home-content gtc:max-content 1fr 1fr
			.home-data gc:initial
			.home-img order:1 js:center
			.about-container,.skills-container,.portfolio-content,.project-container,.contact-container,.footer-container
				gtc:repeat(2,1fr)
			.qualification-sections d:grid gtc:.6fr jc:center

		@768
			.container mx:auto # looks bad on ipad 768px
			body m:0
			.section pt:6rem pb:2rem
			.section-subtitle mb:4rem
			.header t:0 b:initial
			.header,.main,.footer-container px:1rem
			.nav h:calc($header-height + 1.5rem) cg:1rem
			.nav-icon,.nav-close,.nav-toggle d:none
			.nav-list d:flex cg:2rem
			.nav-menu ml:auto # A matter of taste
			.change-theme m:0
			.home-container rg:5rem
			.home-content pt:5.5rem cg:2rem
			.home-blob w:270px
			.home-scroll d:block
			.home-scroll-button ml:3rem
			.about-container cg:5rem
			.about-img w:350px
			.about-description ta:initial
			.about-info jc:space-between
			.about-buttons jc:initial
			.qualification-tabs jc:center
			.qualification-button mx:4
			.qualification-sections gtc:.5fr
			.services-container gtc:repeat(3, 218px) jc:center
			.services-icon fs:2rem
			.services-content p:6rem 0 2rem 2.5rem
			.services-modal-content w:450px
			.portfolio-img w:320px
			.portfolio-content ai:center
			# Questionable taste
			.project ta:initial
			.project-bg bg:none
			.project-container 
				bgc:$color-1-second rd:1rem pt:3rem px:2.5rem
				gtc:1fr max-content cg:3rem
			.project-data pt:.8rem
			.footer-container gtc:repeat(3,1fr)
			.footer-bg pt:3rem pb:3.5rem
			.footer-links fld:row cg:2rem
			.footer-socials js:flex-end
			.footer-copy mt:4.5rem
			
			@1024
				.header,.main,.footer-container p:0
				.home-blob w:320px
				.home-social transform:translateX(-6rem)
				.services-container gtc:repeat(3, 238px)
				.portfolio-content cg:5rem
				.swiper-portfolio-icon fs:3.5rem
				.swiper-button-prev l:-3.5rem
				.swiper-button-next r:-3.5rem
				.swiper-horizontal > .swiper-pagination-bullets b:-4.5rem
				.contact-form w:460px
				.contact-inputs gtc:repeat(2, 1fr)