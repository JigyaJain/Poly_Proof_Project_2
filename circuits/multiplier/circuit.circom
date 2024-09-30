pragma circom 2.0.0;

/*This circuit template checks that c is the multiplication of a and b.*/  

template Multiplier2 () {  

   // signal inputs 
   signal input a;  
   signal input b;  

   // signal from gates
   signal x;  
   signal y;  

   // final signal output
   signal output out;  

   // component gates used to create custom circuit
   component andGate = AND();
   component notGate = NOT();
   component orGate = OR();

   // circuit logic

   andGate.a <== a;   
   andGate.b <== b;
   x <== andGate.x1;

   notGate.b <== b;
   y <== notGate.y1;

   orGate.x1 <== x;   
   orGate.y1 <== y;
   out <== orGate.out1;   
}

template AND() {
    signal input a;
    signal input b;
    signal output x1;

    x1 <== a*b;
}

template NOT() {
    signal input b;
    signal output y1;

    y1 <== 1 + b - 2*b;
}

template OR() {
    signal input x1;
    signal input y1;
    signal output out1;

    out1 <== x1 + y1 - x1*y1;
}

component main = Multiplier2();
