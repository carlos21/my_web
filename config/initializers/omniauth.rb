Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '467557929946955', 'a180c3126055b645bedbb25c2d840d49'
  provider :twitter, 'wsafiRJMozpeDK90klRO2Q', '1hPcIHtBmPV9z9G8nDqHORa6s8A4Xb2eWAuCakk'
  provider :github, '7207c55180f7e4f78d0e', '773b198e6c6a2f891da248d76eafab882dec8459'
end