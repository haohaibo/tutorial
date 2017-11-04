/*
 *
 *      Filename: 174.cpp
 *
 *        Author: Haibo Hao
 *        Email : haohaibo@ncic.ac.cn
 *   Description: ---
 *        Create: 2017-11-04 10:42:11
* Last Modified: 2017-11-04 10:42:26
 **/
#include<iostream>
#include<cstdio>
#include<cstdlib>
#include<vector>
using namespace std;
double dp[120][620];

int main(){
    long long n,m;
    cin>>n>>m;
    long long sum;
    long long s=1;
    for(long long i=1;i<=n;++i){
        s*=6;
    }
    double p=1/6.0;
    for(int i=1;i<=n;++i){
        for(int j=1;j<=m;++j){
            if(i==1){
                if(j>=1&&j<=6){
                    dp[i][j]=1*p;
                }else{
                    dp[i][j]=0;
                }
                continue;
            }
            if(j<i||j>6*i){
                dp[i][j]=0;
            }else{
                for(int k=1;k<=6;++k){
                    if((j-k)>=(i-1)&&(j-k)<=(i-1)*6){
                        dp[i][j]+=dp[i-1][j-k]*p;
                    }
                }  
            }
        }
    }

    printf("%.2lf",dp[n][m]*100.0);
}

