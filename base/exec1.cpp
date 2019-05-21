#include <iostream>

using namespace std; 

bool is_perfect(int n){
    int sum = 0;
    for(int i = 1; i != n; i++){
        if(!(n % i))
            sum += i;
    }
    return sum == n;
}

int main(){
    int n;
    cout << "Digite n:" << endl;
    cin >> n;
    if(is_perfect(n))
        cout << "SIM" << endl;
    else
        cout << "NÃO" << endl;
}
