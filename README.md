Example for Calabash iOS
========================

See
 [https://github.com/calabash/calabash-ios](https://github.com/calabash/calabash-ios)

# Frank plugin support

Intro...

To try the Frank-Calabash plugin support do the following.

1. Make sure frank version `1.2.3` or above is installed. (`gem install frank-cucumber`)

2. Make sure Calabash version `0.10.0` or above is installed (`gem install calabash-cucumber`).

3. Run frank setup: `frank setup` (if using rbenv remember to run `rbenv rehash` after installing frank). 

```
   I found more than one target in this project. Which is the main app target that you wish to Frankify?

   1: LPSimpleExample
   2: LPSimpleExample-cal
   > 1
```

4. Run `frank-calabash install` to install the Calabash plugin to frank:

```
   frank-calabash install
   Creating directory Frank/plugins/calabash
   Copied files Frank/plugins/calabash/calabash.xcconfig.erb, Frank/plugins/calabash/libFrankCalabash.a

   Installed Frank-Calabash plugin.
   Please rebuild using frank build.
```

5. Run `frank build` to build the project for simulator. Verify the successful build of: `"./Frank/frankified_build/Frankified.app"`.

Now it's time to tryout the Frank-Calabash console:

```
$ frank-calabash console
[1] pry(#<Frank::Console>)> launch
=> nil
[2] pry(#<Frank::Console>)> c = calabash_client
=> #<Frank::Calabash::Client:0x007fb3290f4c48>
[3] pry(#<Frank::Console>)> c.query("button")
=> [{"class"=>"UIRoundedRectButton",
  "id"=>nil,
  "rect"=>
   {"center_x"=>136,
    "y"=>287,
    "width"=>72,
    "x"=>100,
    "center_y"=>305.5,
    "height"=>37},
  "frame"=>{"y"=>287, "width"=>72, "x"=>100, "height"=>37},
  "label"=>"BAL:42",
  "description"=>
   "<UIRoundedRectButton: 0x17650a80; frame = (100 287; 72 37); opaque = NO; autoresize = RM+BM; layer = <CALayer: 0x17650c10>>"},
 {"class"=>"UIRoundedRectButton",
  "id"=>nil,
  "rect"=>
   {"center_x"=>145.5,
    "y"=>215,
    "width"=>73,
    "x"=>109,
    "center_y"=>233.5,
    "height"=>37},
  "frame"=>{"y"=>215, "width"=>73, "x"=>109, "height"=>37},
  "label"=>"login",
  "description"=>
   "<UIRoundedRectButton: 0x17648e50; frame = (109 215; 73 37); opaque = NO; autoresize = RM+BM; layer = <CALayer: 0x176491c0>>"}]
[6] pry(#<Frank::Console>)> c.touch("view marked:'Second'")
=> [{"class"=>"UITabBarButton",
  "id"=>nil,
  "rect"=>
   {"center_x"=>120, "y"=>520, "width"=>76, "x"=>82, "center_y"=>544, "height"=>48},
  "frame"=>{"y"=>1, "width"=>76, "x"=>82, "height"=>48},
  "label"=>"Second",
  "description"=>
   "<UITabBarButton: 0x17573150; frame = (82 1; 76 48); opaque = NO; layer = <CALayer: 0x17573680>>"}]
[7] pry(#<Frank::Console>)> launch(app:'com.lesspainful.example.LPSimpleExample', device_target:'device')
[7] pry(#<Frank::Console>)>
```

