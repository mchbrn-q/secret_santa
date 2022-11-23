\l qmail.q

// get sendmail user
user:.z.X 2;

quit:{
    show x;
    exit 11
    };

// error handling
if [0=count user; quit "Please pass sendmail user to script"];
data:@[("SS"; enlist ",") 0:; `:santas.csv; {quit "Please create and populate santas.csv"}];
if [0=count data; quit "Please add fields to santas.csv"];
if [1=count data; quit "Please add more than one field to santas.csv"];

// reset random seed
system "S ", string 7h$.z.t;

map:(data `address)!(data `name);
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

santamail/[count map; 0];
