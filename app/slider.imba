import Swiper, { Navigation, Pagination } from 'swiper'
import 'swiper/css'
import 'swiper/css/navigation'
import 'swiper/css/pagination'

tag slider
	def mount
		Swiper.use([Navigation, Pagination])
		swiper = new Swiper('.swiper-instance', 
			loop: true
			cssMode: true
			navigation: 
				nextEl: ".swiper-button-next"
				prevEl: ".swiper-button-prev"
			pagination: 
				el: ".swiper-pagination"
				clickable: true
			on:
				init: do() console.log('slider component initialized')
		)

	def render
		<self>
			<div.portfolio-container.swiper-instance.swiper[bgc:white]>
				<div.swiper-wrapper>
					<slot />
				<div.swiper-button-next>
					<i.uil.uil-angle-right-b.swiper-portfolio-icon>
				<div.swiper-button-prev>
					<i.uil.uil-angle-left-b.swiper-portfolio-icon>
				<div.swiper-pagination[t:0]>