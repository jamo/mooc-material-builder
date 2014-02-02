class MoocMaterialBuilder < Sinatra::Base

  enable :session
  set :public_folder => "public", :static => true

  configure do
    enable :logging
    file = File.new("#{settings.root}/log/#{settings.environment}.log", 'a+')
    file.sync = true
    use Rack::CommonLogger, file
  end

#  use Rack::Auth::Basic, "Protected Area" do |username, password|
#    username == 'kuje' && password == 'hallitsee'
#  end

#use Rack::Auth::Basic, "Restricted Area" do |username, password|
#  username == 'mooc' and password == 'mooc1'
#end



  get "/" do
    puts session.inspect
    file = "#{settings.root}/log/update-preview.log"
    @result = File.read file if File.exists? file
    erb :welcome
  end

  get "/build-preview" do
    file = "#{settings.root}/log/update-preview.log"
    #thread = Thread.new do
      Bundler.with_clean_env do
        Dir.chdir "/home/jamo/repos/k2014-mooc-materiaali" do
          `bundle exec /home/jamo/repos/mooc-material-builder/jamo.sh 2>&1 >> #{file}`
        end
      end
    #end
    #session[:result] = thread.join.value
    redirect to("/")
  end
end
