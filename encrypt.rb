require 'openssl'
require 'base64'
require 'digest'
require 'bcrypt'

def bin2hex(str)
  str.unpack('C*').map{ |b| "%02x" % b }.join('')
end

def hex2bin(str)
  [str].pack "H*"
end

# modifies the final html page by encrypting its secure-container content
Jekyll::Hooks.register :posts, :post_render do |post|
  if post.data['layout'] == "secret_post"
  	# prepare
  	key = post.data['key']  	
  	out = post.output
  	page = Nokogiri::HTML(out)
  	content = page.css('div#secure-container')[0].inner_html

  	# encrypt
  	aes = OpenSSL::Cipher.new('AES-256-CBC')
  	aes.encrypt	
  	salt = OpenSSL::Random.random_bytes(8)
  	iv = aes.random_iv
  	aes.key = Digest::SHA256.digest(key + bin2hex(salt))
  	aes.iv = iv
  	encrypted = bin2hex(aes.update(content) + aes.final).strip
  	
  	# save
  	page.css('div#secure-container')[0].inner_html = encrypted
  	post.output = page

  	# put iv and salt on page for decryption
  	page.css('div#crypt_params')[0].inner_html = "<script>var _gj = {salt: '"+bin2hex(salt)+"',  iv: '"+bin2hex(iv)+"' } </script>"

  end
end