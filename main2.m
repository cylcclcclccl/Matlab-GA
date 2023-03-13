% this code is based on a simple genetic algorithm for the maximum of 
% a function called func
% the termination is set according to the number of generations ngen
% in this code we keep best individual in each generation 

clear all;clc

ngen = input('enter the number of generations?');
pop_size = input('enter the size of population?');
stringlength = input('enter the string length?');
dimension = input('enter the number of variables?');
var_bound = input('enter a vector containing the bounds for each variable?');

pc = input('enter the cross over probability?');
pm = input('enter the mutation probability?');




% construction of the initial population
pop = round(rand(pop_size,dimension*stringlength));


new_pop = zeros(pop_size,dimension*stringlength);
for i=1:ngen
    
   xx=decoding_pop(pop,dimension,stringlength,var_bound);
   % this part calls the objective function evaluation for the population
   % func is the name of the objective function
   for i1=1:pop_size
       yy(i1) = func(xx(i1,:));
   end
   % ss1 is the vector that contains the probability
   % distribution of the individuals in selection
   % process
   % max_f is the vector of the maximum of func in each generation
   
   max_f(i) = max(yy);
   mm = find(yy>=max(yy));
   ss1 = yy./sum(yy);
   
   % the Roulete selection is used for the selection process
   sum1 = 0;
   for i2=1:pop_size
       ss2(i2) = ss1(i2)+sum1;
       sum1 = ss2(i2);
   end
   
   new_pop(1,:) = pop(mm(1),:);
   new_pop(2,:) = pop(mm(1),:);
   for i3=2:pop_size/2
       aa1=rand;
       aa2=rand;
       for i4=1:pop_size
           if aa1<ss2(i4)
               jj=i4;%index of the first selected parent
               break
           end
       end
       for i5=1:pop_size
           if aa2<ss2(i5)
               kk=i5;%index of the second selected parent
               break
           end
       end
    
    
       % we do cross over on the new selected parents if the cross-over
       % probability is greater than a random number
       if rand<pc
           [ch1 ch2] = cross_over(pop(jj,1:dimension*stringlength),...
         pop(kk,1:dimension*stringlength),dimension,stringlength);
       end
       
       % we do mutaion
       ch11 = mutation(ch1, dimension, stringlength, pm);
       ch22 = mutation(ch2, dimension, stringlength, pm);
       
       
       % we substitute the new offsprings in the new population
       new_pop(2*i3-1,:)=ch11;
       new_pop(2*i3,:)=ch22;
   end
   pop = new_pop;
end
plot((1:ngen),max_f)
max_f = max(max_f)


       
           
       
   
       
   
   
   
   
   
   
   
   
   
    
    