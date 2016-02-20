Classportal::Application.routes.draw do


  resources :user_courses

  resources :users

  resources :student_courses

  resources :courses

  resources :students

  resources :instructors

  resources :admins

  resources :conversations do
    resources :messages
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  #root 'admins#index'
  #root 'sessions#new'

  root 'sessions#new'
  get '/login' => 'sessions#new'
  #get '/rootadmincreate'=> 'users#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  get '/user_students'=> 'users#list_students', as: :list_students
  get '/user_instructors' => 'users#list_instructors', as: :list_instructors
  get '/admin_home_page' => 'users#admin_home_page', as: :admin_home_page

  get '/signup' => 'users#new', as: :signup
  get '/student_home_page' =>'users#student_home_page', as: :student_home_page

  get '/instructor_home_page' => 'users#instructor_home_page', as: :instructor_home_page
  get '/drop_course' => 'users#drop_course', as: :drop_course

  get '/student_enrollment_requests' => 'users#student_enrollment_requests', as: :student_enrollment_requests
  get '/enroll_student' => 'users#enroll_student', as: :enroll_student

  #get '/add_user_course_rel' =>'users#list_user_course', as: :list_user_courses
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end
  
  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
