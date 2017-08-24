class Solution {
public:
    int islandPerimeter(vector<vector<int>>& grid) {
        int r = grid.size();
        int c = grid[0].size();
        int perimeter = 0;
        for(int i = 0; i < r; ++i){
            for(int j = 0; j < c; ++j){
                if(grid[i][j] == 1){
                    if(j <= c-2){
                        if(grid[i][j+1] == 0){
                            ++perimeter;
                        }
                    }else{
                        ++perimeter;
                    }
                    
                    if(j >= 1){
                        if(grid[i][j-1] == 0){
                            ++perimeter;
                        }
                    }else{
                        ++perimeter;
                    }
                    
                    if(i >= 1){
                        if(grid[i-1][j] == 0){
                            ++perimeter;
                        }
                    }else{
                        ++perimeter;
                    }
                    
                    if(i <= r-2){
                        if(grid[i+1][j] == 0){
                            ++perimeter;
                        }
                    }else{
                        ++perimeter;
                    }
                }
            }
        }
        
        return perimeter;
    }
};
