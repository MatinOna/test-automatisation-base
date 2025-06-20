function() {    
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
    env: env,
	baseUrl: 'https://petstore.swagger.io/v2/user',
    urlGetCharacters: 'http://bp-se-test-cabcd9b246a5.herokuapp.com/mpona/api/characters',
    urlGetCharacterById: 'http://bp-se-test-cabcd9b246a5.herokuapp.com/mpona/api/characters/1',
  }
  if (env == 'test') {

    config.urlGetCharacters = 'http://bp-se-test-cabcd9b246a5.herokuapp.com/mpona/api/characters';
    config.urlGetCharacterById = 'http://bp-se-test-cabcd9b246a5.herokuapp.com/mpona/api/characters/1';
    // e.g. config.foo = 'bar';
  } else if (env == 'prod') {
    config.urlGetCharacters = 'http://bp-se-test-cabcd9b246a5.herokuapp.com/mpona/api/characters';
    config.urlGetCharacterById = 'http://bp-se-test-cabcd9b246a5.herokuapp.com/mpona/api/characters/1';
  }
  karate.configure('connectTimeout', 15000);
  karate.configure('readTimeout', 15000);
  karate.configure('ssl', { trustAll: true });
  return config;
}
