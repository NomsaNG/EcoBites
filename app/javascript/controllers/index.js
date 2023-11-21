// Import and register all your controllers from the importmap under controllers/*

import { application } from "controllers/application"

// Eager load all controllers defined in the import map under controllers/**/*_controller
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
eagerLoadControllersFrom("controllers", application)

// Lazy load controllers as they appear in the DOM (remember not to preload controllers in import map!)
// import { lazyLoadControllersFrom } from "@hotwired/stimulus-loading"
// lazyLoadControllersFrom("controllers", application)

// const carouselWidth = $('.carousel-inner')[0].scrollWidth;
// const cardWidth = $('.carousel-item').width();

// let scrollPosition = 0;

// $('.carousel-control-next').on('click', function(){
//   console.log('next');
//   scrollPosition = scrollPosition + cardWidth;
//   $('.carousel-inner').animate({scrollLeft: scrollPosition}, 600);
// });

// $('.carousel-control-prev').on('click', function(){
//   console.log('prev');
//   scrollPosition = scrollPosition - cardWidth;
//   $('.carousel-inner').animate({scrollLeft: scrollPosition}, 600);
// });


