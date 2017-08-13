#!/usr/bin/env perl
# don't mind the quadruple for loop - it's just for the looks - you'll see

for ($l = 0; $l <=3; $l+=3) {
        for ($b = 0; $b < 6; $b++) {
                for ($g = $l; $g < $l+3; $g++) {
                        for ($r = 0; $r < 6; $r++) {
                                $c = 16+($r*36)+($g*6)+$b;
                                printf("\e[%d;48;5;%dm %3d \e[0m", $l==3 ? 30 : 37, $c, $c);
                        }
                        print " ";
                }
                print "\n";
        }
        printf "\n";
}