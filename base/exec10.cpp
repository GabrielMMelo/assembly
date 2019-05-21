#include <iostream>

using namespace std;

bool belongs2h(float x, float y){
    if (x < 0)
        return false;

    if (y < 0)
        return false;

    return x*x + y*y <= 1;
}

int main(){
    float x, y;
    cout << "Digite x:" << endl;
    cin >> x;
    cout << "Digite y:" << endl;
    cin >> y;

    if(belongs2h(x, y))
        cout << "SIM" << endl;
    else
        cout << "NÃO" << endl;

}
