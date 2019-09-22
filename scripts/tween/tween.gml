/// @describe Smoothly transition between values
/// @param kind
/// @param start
/// @param finish
/// @param total_time
/// @param current_time
var K=argument0, xs=argument1, xf=argument2, T=argument3, t=argument4, D=(xf-xs), V=0, O=0;
if (t==T) {return xf;} //Skip calculation
switch(K)
{
    case tw_linear: //Constant speed
        V = (D/T);
        O = V*t;
    break;
    case tw_cubic: //slow FAST slow
        V = (3*D)/(2*T);
        O = ((-1)*(V/power(T/2,2))) * ((power(t,3)/3) - T*(power(t,2)/2) + power(T/2,2)*t) + (V*t);
    break;
    case tw_fastin: //Fast slow
        V = D/sqrt(T);
        O = V*sqrt(t);
    break;
    case tw_fastout: //slow Fast
        V = D/power(T,2);
        O = V*power(t,2);
    break;
    case tw_expin: //FAST slow slower
        V = D/ln(T+1);
        O = V*ln(t+1);
    break;
    case tw_expout: //slow faster FAST
        V = ln(D+1)/T;
        O = exp(V*t);
    break;
}
return O+xs;