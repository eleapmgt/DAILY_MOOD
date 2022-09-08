// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import HelloController from "./hello_controller"
import RangeSliderController from "./range_slider_controller"
import UserCategoriesController from "./user_categories_controller"
import WheelController from "./wheel_controller"
import Sortable from './sortable_controller'

application.register("hello", HelloController)
application.register('range-slider', RangeSliderController)
application.register('wheel', WheelController)
application.register("user-categories", UserCategoriesController)
application.register('sortable', Sortable)


// import { Application } from '@hotwired/stimulus'

// const application = Application.start()
