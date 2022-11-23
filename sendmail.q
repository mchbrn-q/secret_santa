\l qmail.q

system "S ", string 7h$.z.t;

data:("SS"; enlist ",") 0: `:santas.csv;
map:(data `benefactor)!(data `beneficiary);
randoms:();

randomise:{$[not sum (value map)=randoms::(value map) (neg count map)?(count map);1;0]};

randomise/[1>;0];

randommap:(key map)!randoms;

add:{BODY,:$[0h=type x;x;enlist x]};

sendmail:{
    address:(cols randommap) x

    mail.send["santaclaus@secretsanta.mail";address;"Who shall be thy beneficiary";BODY;`];
    exit 0
  }

// add .mail.heading["1";"Merry Christmas, Michael!"]
// add .mail.heading["3";"For secret santa this year, you will be giving gifts to . . ."]
// add .mail.bold["Matthew"]
// 
// .mail.send["santaclaus@secretsanta.mail";"mike@techknowledg.ie";"Who shall be thy beneficiary?";BODY;`];
