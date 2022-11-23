\l qmail.q

user:.z.X 2;

if [0=count user; show "Please pass sendmail user to script"];

// reset random seed
system "S ", string 7h$.z.t;

data:("SS"; enlist ",") 0: `:santas.csv;
map:(data `benefactor)!(data `beneficiary);
randoms:();

// create random list of beneficiaries
randomise:{$[not sum (value map)=randoms::(value map) (neg count map)?(count map);1;0]};

// get random list of beneficiaries such that no benefactor is assigned himself
randomise/[1>;0];

// map benefactors to beneficaires
randommap:(key map)!randoms;

// define qmail add fn
add:{BODY,:$[0h=type x;x;enlist x]};

santamail:{
    if [0=count user; exit 0];

    benefactor:string (value map) x;
    beneficiary:string (value randommap) x;
    address:string (key randommap) x;

    add .mail.heading["1";"Merry Christmas, ", benefactor, "!"];
    add .mail.heading["3";"For secret santa this year, you will be giving gifts to . . ."];
    add .mail.bold[.mail.addcolor["rgb(8, 143, 143)"; beneficiary]];

    show "Sending mail from ", user;
    .mail.send[user; address; "Who shall be thy beneficiary?"; BODY; `];

    x + 1
  };

/santamail/[count map; 0]

testsantamail:{
    if [0=count user; exit 0];

    address:string (key randommap) x;
    num:string sum "j"$string (value randommap) x;

    add .mail.heading["1"; num];

    show "Sending mail from ", user;
    .mail.send[user; address; "Testing 1 2 3"; BODY; `];

    delete BODY from `.;

    x + 1
  };

/testsantamail\[count map; 0];

testmail:{
    if [0=count user; exit 0];

    add .mail.heading["1";"Merry Christmas, Michael!"];
    add .mail.heading["3";"For secret santa this year, you will be giving gifts to . . ."];
    add .mail.bold[.mail.addcolor["rgb(8, 143, 143)"; "Matthew"]];

    show "Sending mail from ", user;
    .mail.send[user; "michael.burns@aquaq.co.uk"; "Who shall be thy beneficiary?"; BODY; `];

    delete BODY from `.;

    x + 1
  };

/testmail\[count map; 0]
