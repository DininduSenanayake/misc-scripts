2335  2019-01-23 11:03:58 mkdir easybuildinstall
 2336  2019-01-23 11:04:25 cd /nesi/nobackup/nesi99999/
 2337  2019-01-23 11:04:26 ls
 2338  2019-01-23 11:04:31 cd Dinindu/
 2339  2019-01-23 11:04:31 l
 2340  2019-01-23 11:04:34 ls
 2341  2019-01-23 11:04:41 mkdir easybuildinstall
 2342  2019-01-23 11:04:55 cd ~
 2343  2019-01-23 11:05:22 rmdir easybuildinstall
 2344  2019-01-23 11:06:03 ln -s /nesi/nobackup/nesi99999/Dinindu/easybuildinstall ./
 2345  2019-01-23 11:07:19 darcs --help
 2346  2019-01-23 11:08:34 mkdir -p easybuild/mahuika
 2347  2019-01-23 11:08:41 cd easybuild/mahuika/
 2348  2019-01-23 11:09:12 darcs init
 2349  2019-01-23 11:09:51 darcs pull /opt/nesi/nesi-apps-admin/Mahuika/
 2350  2019-01-23 11:10:30 ls
 2351  2019-01-23 11:11:15 cd easyconfigs/
 2352  2019-01-23 11:11:16 ls
 2353  2019-01-23 11:12:21 cd ..
 2354  2019-01-23 11:12:22 kl
 2355  2019-01-23 11:12:35 cd -
 2356  2019-01-23 11:13:03 mkdir ~/modules
 2357  2019-01-23 11:13:21 cd ~/modules/
 2358  2019-01-23 11:14:01 ln -s ~/pmax001/top_level/nesi_eb.lua
 2359  2019-01-23 11:14:09 ls
 2360  2019-01-23 11:14:14 cat nesi_eb.lua
 2361  2019-01-23 11:14:22 ls -l
 2362  2019-01-23 11:14:39 rm nesi_eb.lua
 2363  2019-01-23 11:14:59 ln -s ~pmax001/top_level/nesi_eb.lua
 2364  2019-01-23 11:15:02 cat nesi_eb.lua
 2365  2019-01-23 11:16:39 cd -
 2366  2019-01-23 11:18:17 cat > FALCON-1.8.8-intel-2017b.eb
 2367  2019-01-23 11:24:09 nano FALCON-1.8.8-intel-2017b.eb
 2368  2019-01-23 11:26:02 mv FALCON-1.8.8-intel-2017b.eb FALCON-1.8.8-gimkl-2017a.eb
 2369  2019-01-23 11:26:26 module use ~/modules
 2370  2019-01-23 11:26:37 module load nesi_eb
 2371  2019-01-23 11:26:45 ml
 2372  2019-01-23 11:27:26 grep easyb ~/modules/nesi_eb.lua
 2373  2019-01-23 11:27:43 eb --help
 2374  2019-01-23 11:28:23 eb FALCON-1.8.8-gimkl-2017a.eb
 2375  2019-01-23 11:37:14 eb DBG2OLC-20170208-gimkl-2017a.eb
 2376  2019-01-23 11:41:51 grep MakeCp *.eb
 2377  2019-01-23 11:43:27 cp Bowtie2-2.3.2-gimkl-2017a.eb Canu-1.8-gimkl-2017a.eb
 2378  2019-01-23 11:43:32 nano Canu-1.8-gimkl-2017a.eb
 2379  2019-01-23 12:00:54 eb Canu-1.8-gimkl-2017a.eb
 2380  2019-01-23 12:01:51 grep start *.eb
 2381  2019-01-23 12:01:59 nano Canu-1.8-gimkl-2017a.eb
 2382  2019-01-23 12:06:30 eb Canu-1.8-gimkl-2017a.eb
 2383  2019-01-23 12:08:09 nano Canu-1.8-gimkl-2017a.eb
 2384  2019-01-23 12:08:43 eb Canu-1.8-gimkl-2017a.eb
 2385  2019-01-23 12:11:42 find  ~/easybuildinstall/software/Canu/1.8-gimkl-2017a/bin/ -name canu
 2386  2019-01-23 12:12:10 file /home/dsen018/easybuildinstall/software/Canu/1.8-gimkl-2017a/bin/pipelines/canu
 2387  2019-01-23 12:15:24 less /home/dsen018/easybuildinstall/software/Canu/1.8-gimkl-2017a/easybuild/easybuild-Canu-1.8-20190123.120950.log
 2388  2019-01-23 12:16:35 nano Canu-1.8-gimkl-2017a.eb
 2389  2019-01-23 12:20:31 eb Canu-1.8-gimkl-2017a.eb
 2390  2019-01-23 12:20:44 eb --force Canu-1.8-gimkl-2017a.eb
 2391  2019-01-23 12:22:17 file  /home/dsen018/easybuildinstall/software/Canu/1.8-gimkl-2017a/bin/*
 2392  2019-01-23 12:22:34 less /home/dsen018/easybuildinstall/software/Canu/1.8-gimkl-2017a/bin/canu
 2393  2019-01-23 12:24:06 module use /home/dsen018/easybuildinstall/modules/all/
 2394  2019-01-23 12:24:14 module load Canu
 2395  2019-01-23 12:24:17 ml
 2396  2019-01-23 12:24:32 nano Canu-1.8-gimkl-2017a.eb
 2397  2019-01-23 12:26:09 canu --help
 2398  2019-01-23 12:26:54 darcs add Canu-1.8-gimkl-2017a.eb FALCON-1.8.8-gimkl-2017a.eb DBG2OLC-20170208-gimkl-2017a.eb
 2399  2019-01-23 12:27:17 darcs record
 2400  2019-01-23 12:29:25 darcs log | less
 2401  2019-01-23 14:49:11 history > printHistory.txt
%take a note on darcs path

%Notes from Februay4th
4202  2019-02-04 10:33:31 darcs log | head
4203  2019-02-04 10:33:45 darcs status
4204  2019-02-04 10:33:55 ls -ltr
4205  2019-02-04 10:34:00 cd easyconfigs/
4206  2019-02-04 10:34:02 ls -ltr
4207  2019-02-04 10:35:27 cp -p  ~/easybuildinstall/software/BLASR-2.2-gimkl-2017a.eb ./
4208  2019-02-04 10:35:36 ls -ltr
4209  2019-02-04 10:36:49 chgrp dsen018 BLASR-2.2-gimkl-2017a.eb
4210  2019-02-04 10:36:58 cd ~/easybuildinstall/

IMPORTANT  : ALL darcs adds should be done from "/home/dsen018/easybuild/mahuika/easyconfigs"



#making the installed modules glbal
  sudo -i -u nesi-apps-admin
  cd Mahuika
  source init.sh
  less init.sh
  module load EasyBuild/3.5.3
  darcs pull /home/dsen018/easybuild/mahuika
  cd easyconfigs
  eb Canu.eb xxx.eb yyy.eb  #Ideal to do in a tmux session to avoid timeouts
#To delete everything from my /software directory
  rm -rf ~/easybuildinstall/*/*
