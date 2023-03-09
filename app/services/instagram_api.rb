class InstagramApi

def call
  client = InstagramBasicDisplay::Client.new
  code = "AQBBQxSejKDWCuyQogkZFYDLkFc7sHJkY4g5v2EEVm_bTMquZD7A17Tj0F-b05sKwymVJAvl87TL4ODU2QEaSdFWCWLppbwR9jMq3ul2o75aurzisJ9YzH-cIzW7NXW9nWyxRgMspNnYja-dtS0zOv6jyWZdI4WZlQmB0aitQzeA5KBh-baPTjIHIcpsRqjEuTmpLu5ouOCV4HddZqLy6OZZ3VnOr-Gj7stgBF0S0EqdRA"
  short_token_request = client.short_lived_token(access_code: code)
  p short_token_request
  if short_token_request.success?
    auth_token = short_token_request.payload.access_token
    long_token_request = client.long_lived_token(short_lived_token: auth_token)
    long_auth_token = long_token_request.payload.access_token
    p long_auth_token
    # p short_token_request.payload

    # expires_in = short_token_request.payload.expires_in
    # p auth_token
    # p expires_in
  else
    render json: short_token_request.error, status: 400
  end
end


def refresh_token
  client = InstagramBasicDisplay::Client.new
  code = "IGQVJVWUE3b3A3cGp1SEJHcHIybGV6NTdhMHdOT2RnX2kxVkZAOR0lqdEc3SzhiOVMtd2hmc1JYTGI5c2diMVJId29fWVZAGc3oxT3hSWXhRZAGg4V2JJWTJFczJQS2VQTXRWS2d0WXdB"
  refresh_request = client.refresh_long_lived_token(token: code)
  p refresh_request.payload
end

end
