#include<stdio.h>
#define size 5
int q[size],rear=-1,front=-1;
void insert();
int delete();
void display();
void main()
{int n;
do{
printf("enter the option from 1 to 4,4 to exit,1 to insert,2 to delete and 3 to display ");
scanf("%d",&n);
switch(n)
{
case 1:insert();
break;
case 2:delete();
break;
case 3:display();
break;
case 4:exit(0);
default:printf("invalid");
break;
}}while(n!=4);


}
void insert()
{
int m;
printf("enter the no to be inserted");
scanf("%d",&m);
if(rear==size-1&&front==0)
{printf("overflow");}
else if(front==-1){
front=0;}
else{(rear=rear+1)%(size);}
q[rear]=m;
}
int delete ()
{ int val;
if(front==-1)
{printf("underflow");}
else val=q[front];
if(front==rear){
front=-1;rear=-1;}
else front=(front+1)%(size);

return val;

}
void display()
{int i;
if (front==-1){
printf("underflow");
}else
for ( i=front;i!=rear;i=(i+1)%(size))
{
printf("ele are %d",q[i]) ;}
printf("%d",q[i]);
}
