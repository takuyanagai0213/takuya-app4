# frozen_string_literal: true

# require "rspec/core/rake_task"
require 'aws-sdk-codedeploy'
require 'aws-sdk-s3'

# # Rspec
# RSpec::Core::RakeTask.new("spec")
# task :default => :spec

# Configs for codedeploy
APP_NAME = 'fishingshares'
S3_BUCKET = 'tf-bucket11'
S3_PREFIX = 'app/versions/'
TAG = `git describe --tags`.strip
DEPLOY_GROUP_NAME = 'fishingshares-deploygroup'

desc "Deploy with codedeploy"
task :deploy do
  # upload files to s3
  zip_file = "#{APP_NAME}_#{TAG}.zip"
  s3_key = S3_PREFIX + '/' + zip_file
  `git archive HEAD --output=#{zip_file}`
  begin
    Aws::S3::Client.new.put_object(bucket: S3_BUCKET, key: s3_key, body: File.open(File.basename(zip_file)))
  ensure
    File.delete(zip_file)
  end
  # register revision
  revision = {
    revision_type: 'S3',
    s3_location: {
      bucket: S3_BUCKET,
      key: s3_key,
      bundle_type: 'zip',
    },
  }
  codedeploy = Aws::CodeDeploy::Client.new
  codedeploy.register_application_revision(application_name: APP_NAME, revision: revision)
  # deploy
  codedeploy.create_deployment(application_name: APP_NAME,
                               deployment_group_name: DEPLOY_GROUP_NAME,
                               revision: revision,
                               file_exists_behavior: 'OVERWRITE')
end