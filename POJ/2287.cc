#include<iostream>
#include<cstdio>
#include<cstdlib>
#include<cmath>
#include<vector>
#include<algorithm>

using namespace std;

bool comp(int a,int b){
	return a>=b? true:false;
}
int tian[1005],king[1005];
// greedy
int main(){
	int n;
	int silver;
	while(cin>>n){
		silver=0;
		if(n==0){
			break;
		}

		for(int i=0;i<n;++i){
			cin>>tian[i];
		}
		for(int i=0;i<n;++i){
			cin>>king[i];
		}
		sort(tian,tian+n,comp);
		sort(king,king+n,comp);
		int s_tian=0,e_tian=n-1;
		int s_king=0,e_king=n-1;
		//int cnt=0;
		while(s_tian<=e_tian){
			if(tian[s_tian]>king[s_king]){//pk
				++s_tian;
				++s_king;
				silver+=200;
			}else{
				if(tian[s_tian]<king[s_king]){//pk
					--e_tian;
					++s_king;
					silver-=200;
				}else{//tian[s_tian]==king[s_king]
					if(tian[e_tian]>king[e_king]){//pk
						--e_tian;
						--e_king;
						silver+=200;
					}else{
						if(tian[e_tian]<king[s_king]){
							silver-=200;
						}
						--e_tian;
						++s_king;
					}
				}
			}
		}
		//cout<<silver<<endl;
		printf("%d\n",silver);
	}
	return 0;
} 
