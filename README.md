## Create the app

Navigate to the [Boxee apps directory](http://developer.boxee.tv/Applications#UserData.2FApps_Locations) in a terminal. Then run:

	git clone git://github.com/tommysqueak/Boxee-Boilerplate.git developer-id.your-app-id

The developer-id should be your unique prefix for you or your company. Mine is 'greatboxee'.

Then open up the descriptor.xml (located in the developer-id.your-app-id directory) in your editor of choice and fill in the blanks. Open Boxee and check it runs ok. Make a kick-ass app.

If you're using Git for source control, rename example.gitignore to .gitignore

## Package your app

You'll need Ruby, Rake and bundler installed (gem install bundler, gem install rake).

Open build/environments.yml and fill in the blanks.

From a terminal:
	
	cd build
	bundle install
	rake

This will create 2 packaged apps. One for deployment to your staging server/repository and one for the official Boxee app library.

### Credit
Grid by Bartsidee - http://www.bartsidee.nl