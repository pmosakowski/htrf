# htrf
The Kennel Club - Health Result Test Finder

## Requirements

You will need to have the following utilties installed:
- xmllint
- pr

## Usage

Make the script executable:
`chmod +x htrf.sh`

Invoke the script:
`./htrf.sh <dog name> [<filter>]`

## Examples

```
$ ./htrf.sh jojo 2019
Getting total page count
39 pages
Downloading and parsing pages:
1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39
1   ANGARRICK JOJO                                  Spaniel (English Springer)           Bitch                                          28 March 2019
3   BANCAPEL CHWAER JOJO                            Beagle                               Bitch  TRICOLOUR                               16 January 2019
3   BANCAPEL JOJO FACH                              Beagle                               Bitch  TRICOLOUR                               16 January 2019
3   BILLY JOJO                                      Border Terrier                       Bitch  BLACK                                   22 August 2019
7   DODOBOY JOJO                                    Retriever (Labrador)                 Bitch                                          26 December 2019
20  JOJO MCCO'S STRAWBERRY FIELD                    Retriever (Labrador)                 Bitch  BLACK                                   12 June 2019
22  JOJO RABBIT                                     Whippet                              Dog    RED and WHITE                           11 September 2019
23  JOJO SIWA                                       French Bulldog                       Bitch  FAWN WITH BLACK MASK                    20 June 2019
23  JOJO SON                                        Bulldog                              Dog    RED and WHITE                           09 February 2019
24  JOJO TARTH                                      Bull Terrier                         Bitch  TRICOLOUR                               20 September 2019
27  KAZIAHS JOJO LITTLELEGS                         Dachshund (Miniature Smooth Haired)  Bitch  BLACK and TAN                           07 April 2019
29  LITTLE JOJO                                     Bulldog                              Dog    BLUE and WHITE TRIM                     12 June 2019
30  LOWBORELAND JOJO                                Retriever (Labrador)                 Bitch  BLACK                                   13 March 2019
31  MESI AMARA JOJO                                 Rhodesian Ridgeback                  Bitch  WHEATEN                                 11 December 2019
31  MISS JOJO POPS                                  Dachshund (Miniature Smooth Haired)  Bitch  CHOCOLATE and TAN                       31 May 2019
```
