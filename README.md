# Twitter Follow Recommendations

Who do the people you follow, follow? Pick your favorite twitter users and get a list of recommended people you don't follow.

## Prereqs

1. Install [**t**](https://github.com/sferik/t).

2. Authorize with **t** via `t authorize`

   If you run into an error while using this, just edit `~/.trc` manually. The format for mine (which works) looks like this:

   ```yaml
   ---
   configuration:
     default_profile:
     - MY_USERNAME
     - MY_CONSUMER_KEY
   profiles:
     MY_USERNAME:
       MY_CONSUMER_KEY:
         username: MY_USERNAME
         consumer_key: MY_CONSUMER_KEY
         consumer_secret: MY_CONSUMER_SECRET
         token: MY_TOKEN
         secret: MY_SECRET
   ```

   Things in all caps are values you should replace with tokens from the twitter app dashboard.

3. Pick a list of people you like on twitter and put them in `favorites.txt`. For example:

```
$ cat favorites.txt
alain
devonzuegel
backus
rsnous
```

## Usage

Run `./main.sh` with your twitter username and the number of recommendations you want. In my case if I want 20 recommendations, I run

```
$ ./main.sh backus 20

...

Top 20 recommendations:

      8 andy_matuschak
      7 eiaine
      7 PTetlock
      7 JonHaidt
      7 Altimor
      6 waitbutwhy
      6 sknthla
      6 primalpoly
      6 ncasenmare
      6 kevin2kelly
      6 kamens
      6 danwwang
      6 clairlemon
      6 benthompson
      6 adamdangelo
      6 Meaningness
      6 MIRIBerkeley
      6 KatjaGrace
      6 DavidDeutschOxf
      6 ATabarrok
```

You may get rate limited by twitter if you put a lot of people in your `favorites.txt`! Just give it time
