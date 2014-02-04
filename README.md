Resmaker
--------
**Resmaker** is a very simple tool written in Ruby which helps to create scaled images for Android resources.

Installation
----------
Resmaker is based on great library **ImageMagick**. Installation of ImageMagick may differ on various OS.

OS X
```
 sudo port install ImageMagick #MacPorts
 # or
 sudo brew install ImageMagick #Homebrew
```

Ubuntu 
```
 apt-get install imagemagick
```

> For different OS check: http://www.imagemagick.org/script/binary-releases.php

Also rmagick gem is required. To instal rmagick simply run
```
sudo gem install rmagick
# or 
bundle install 
```

Usage
--------
Before first usage set 
```
chmod +x resmaker.rb
```

To scale image to Android resources run
```
resmaker.rb example.jpg # starts from xhdpi and scale down
# or 
resmaker.rb example.jpg --xxhdpi # starts from xxhdpi
```

As a result res folder will be created with appropriate images
```
/res
    /drawable-hdpi/example.jpg
    /drawable-mdpi/example.jpg
    /drawable-xhdpi/example.jpg
    /drawable-xxhdpi/example.jpg
```



