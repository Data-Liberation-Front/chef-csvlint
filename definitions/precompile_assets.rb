define :precompile_assets, :params => {} do
  bash 'Precompiling assets' do
    cwd params[:cwd]
    user params[:user]
    code <<-EOF
      RACK_ENV=production bundle exec rake assets:precompile > /tmp/first_run 2>&1
    EOF
  end
end
