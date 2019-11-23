close all; clear;
theta1=0;d1=0;a1=13;
theta2=0;d2=0;a2=30;
pos=[-15 15 30 30];
xi=a1; yi=a2;
b=0;
p0=[0 0];
while(1)
    while b==0
        d=sqrt(xi^2+yi^2);
        theta_t1=acosd((d^2+a1^2-a2^2)/(2*a1*d));
        theta_t2=acosd((d^2+a2^2-a1^2)/(2*a2*d));
        theta_mid=180-theta_t1-theta_t2;
        th_demo=(xi<0)*(180-atand(yi/abs(xi)))+(xi>0)*atand(yi/xi);
        theta1=th_demo-theta_t1;
        theta2=90-theta_mid+theta1;
        del_theta=theta1-theta2;
        
        for i=0:1:theta1
            p1=[a1*cosd(i) a1*sind(i)];
            p2=[p1(1,1)-a2*sind(i) p1(1,2)+a2*cosd(i)];
            q1=[p0(1,1) p1(1,1) p2(1,1)];
            q2=[p0(1,2) p1(1,2) p2(1,2)];
            plot(q1,q2,'-o','LineWidth',4);
            axis([-45,45,-45,45]);
            grid on;
            hold on
            rectangle('Position',pos,'EdgeColor','r')
            rectangle('Position',[-15 -15 30 30],'EdgeColor','b')
            hold off
            pause(0.01)
        end
        pause(1);
        
        for i=0:1:abs(del_theta)
            j=(del_theta<0)*(theta1+i)+(del_theta>0)*(theta1-i);
            p1=[a1*cosd(theta1) a1*sind(theta1)];
            p2=[p1(1,1)-a2*sind(j) p1(1,2)+a2*cosd(j)];
            q1=[p0(1,1) p1(1,1) p2(1,1)];
            q2=[p0(1,2) p1(1,2) p2(1,2)];
            plot(q1,q2,'-o','LineWidth',4);
            axis([-45,45,-45,45]);
            grid on;
            hold on
            rectangle('Position',pos,'EdgeColor','r')
            rectangle('Position',[-15 -15 30 30],'EdgeColor','b')
            hold off
            pause(0.01)
        end

        b=1;
        hold off
    end
    if b==1
       [xi,yi,buttons] = ginput(1);
       b=0;
    end
end
