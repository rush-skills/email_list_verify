require "email_list_verify/version"

require 'rest-client'
class EmailListVerify
  BASE = 'https://app.emaillistverify.com/api'
  ONE_BY_ONE_PATH = BASE + "/verifEmail"
  UPLOAD_FILE_PATH = BASE + "/verifApiFile"
  FILE_INFO_PATH = BASE + "/getApiFileInfo"
  BULK_ERRORS = ["no_credit","cannot_upload_file","key_not_valid","missing_parameters"]

  def initialize(api_key)
    @api_key = api_key
  end
  def one_by_one(email)
    options = {params: {email: email, secret: @api_key}}
    RestClient.get(ONE_BY_ONE_PATH, options)
  end
  def upload_file(file_name, file_path=nil)
    file_path ||= file_name
    options = {file_contents: File.new(file_path)}
    url = UPLOAD_FILE_PATH+"?secret=#{@api_key}&filename=#{file_name}"
    res = RestClient.post(url, options)
    unless BULK_ERRORS.include? (res.to_s)
      @id = res
    end
    res
  end
  def bulk_status(file_id=nil)
    unless file_id or @id
      return "Please provide the file_id or call the upload_file with a success"
    end
    id = file_id
    id ||= @id
    options = {params: {id: id, secret: @api_key}}
    RestClient.get(FILE_INFO_PATH, options)
  end
end