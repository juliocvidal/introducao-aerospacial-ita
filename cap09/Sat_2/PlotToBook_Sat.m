
function PlotToBook_Sat(ScopeData1,ScopeData2,ScopeData3,ScopeData4,ScopeData5,ScopeData6)
global fsz lw

close all

% Defaults for this blog post
width = 5.5;     % Width in inches
height = 4.5;    % Height in inches
alw = 0.75;    % AxesLineWidth
fsz = 10;      % Fontsize
lw = 1.5;      % LineWidth
msz = 8;       % MarkerSize



% The properties we've been using in the figures
set(0,'defaultLineLineWidth',lw);   % set the default line width to lw
set(0,'defaultLineMarkerSize',msz); % set the default line marker size to msz
set(0,'defaultLineLineWidth',lw);   % set the default line width to lw
set(0,'defaultLineMarkerSize',msz); % set the default line marker size to msz

% Set the default Size for display
defpos = get(0,'defaultFigurePosition');
set(0,'defaultFigurePosition', [defpos(1) defpos(2) width*100, height*100]);

% Set the defaults for saving/printing to a file
set(0,'defaultFigureInvertHardcopy','on'); % This is the default anyway
set(0,'defaultFigurePaperUnits','inches'); % This is the default anyway
defsize = get(gcf, 'PaperSize');
left = (defsize(1)- width)/2;
bottom = (defsize(2)- height)/2;
defsize = [left, bottom, width, height];
set(0, 'defaultFigurePaperPosition', defsize);
t = ScopeData1(:,1);

% Longitudinal Elevator Plots
disp('-------         Plotting')
% clf; 
% set(gcf,'Position',[20,50,500,650]);
% set(gcf,'DefaultAxesUnits','normalized');


figure(5)
% Stick
h=subplot(1,1,1);
%title(sprintf('ELEVATOR Doublet Simulation'))
x0=ScopeData1(:,2);
%x1=ScopeData1(:,2);
x2=ScopeData1(:,3);
PlotSub2('t [s]','$r~[u.n.]$',t,x0,[],x2,h,.1);
legend('Não linear','Linear');

figure(10)
h=subplot(1,1,1);
 a0=ScopeData2(:,2);
% a1=ylong(:,2)*RAD+yout(1,IndAlf);
 a2=ScopeData2(:,3);
PlotSub2('t [s]','$\dot{r}~[u.n.]$',t,a0,[],a2,h,.1);
legend('Não linear','Linear');


figure(15)
% Stick
h=subplot(1,1,1);
%title(sprintf('ELEVATOR Doublet Simulation'))
x0=ScopeData3(:,2);
%x1=ScopeData1(:,2);
x2=ScopeData3(:,3);
PlotSub2('t [s]','$\alpha~[^{\circ}]$',t,x0,[],x2,h,.01);
legend('Não linear','Linear');

figure(20)
h=subplot(1,1,1);
 a0=ScopeData4(:,2);
% a1=ylong(:,2)*RAD+yout(1,IndAlf);
 a2=ScopeData4(:,3);
PlotSub2('t [s]','$\dot{\alpha}~[^{\circ}/s]$',t,a0,[],a2,h,.1);
legend('Não linear','Linear');


figure(25)
h=subplot(1,1,1);
 q0=ScopeData5(:,2);
% q1=ylong(:,3)*RAD+q0(1);
 q2=ScopeData5(:,4);
PlotSub2('t [s]','$\tau_{1}$ [Nm]',t,q0,[],q2,h,0.1);
legend('Não linear','Linear');

figure(30)
h=subplot(1,1,1);
 q0=ScopeData5(:,3);
% q1=ylong(:,3)*RAD+q0(1);
 q2=ScopeData5(:,5);
PlotSub2('t [s]','$\tau_{2}$ [Nm]',t,q0,[],q2,h,0.1);
legend('Não linear','Linear')

figure(35)
h=subplot(1,1,1);
 b0=ScopeData6(:,2);
% q1=ylong(:,3)*RAD+q0(1);
 b2=ScopeData6(:,3);
PlotSub2('t [s]','$r(t)$,$\alpha(t)$',t,b0,[],b2,h,0.01);
legend('Ref. $r(t)$','Ref. $\alpha(t)$')
set(legend,'interpreter','latex')
grid on

% Theta
% h=subplot(4,1,4);
%  the0=Data_DM(:,5);;
%  %the1=ylong(:,4)*RAD    +the0(1)+q0(1)*t;
%  the2=Data_NM(:,5);
% PlotSub('Time [s] --->','\theta [deg]',t,the0,[],the2,h,0.1);

% % Nz
% h=subplot(5,1,5);
% Dq1=ylong(:,3);
% Dq2=ylong_red(:,3);
% x0=yout(:,IndNz);
% x1=ylong(:,5)    +x0(1);
% x2=ylong_red(:,5)+x0(1);
% PlotSub('Time [s] --->','Nz [g]',t,x0,x1,x2,h,0.02);

% Vtas
% h=subplot(4,1,1);
%  cas0=Data_DM(:,3);;
% % tas1=ylong(:,1)/0.5144444  +tas0(1);
%  cas2=Data_NM(:,3);;
% PlotSub([],'V_{CAS} [Knots]',t,cas0,[],cas2,h,0.02);
% legend('Non Augmented','Augmented');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function NewYTick(h,maxdelta)
ylim=get(h,'Ylim');
ytick=get(h,'Ytick');
delta=ylim(2)-ylim(1);
if maxdelta>=1 RR=1;
elseif maxdelta>=0.1 RR=10;
elseif maxdelta>=0.01 RR=100;
else RR=1000;
end
ymean=round((ylim(2)+ylim(1))/2*RR)/RR;
DD=(ylim(2)-ylim(1))/4;
if delta<2*maxdelta DD=maxdelta/2;end;
set(h,'Ylim', [ymean-2*DD    ymean+2*DD]);
set(h,'Ytick',[ymean-2*DD:DD:ymean+2*DD]);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function PlotSub3(Xlab,Ylab,t,x0,x1,x2,h,maxdelta)
global fsz lw
hold off;
%ylabel(Ylab);
ylabel(Ylab,'FontSize',fsz,'FontWeight','normal','interpreter','latex');
if isempty(Xlab)
    set(h,'XTickLabel',[]);
else
    xlabel(Xlab,'FontSize',fsz);
end
hold on; grid on;
plot(t,x0,'-b','LineWidth',lw);
plot(t,x1,'-.g','LineWidth',lw);
plot(t,x2,'--r','LineWidth',lw);
NewYTick(h,maxdelta);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function PlotSub2(Xlab,Ylab,t,x0,x1,x2,h,maxdelta)
 
global fsz lw
hold off;
%ylabel(Ylab);
ylabel(Ylab,'FontSize',fsz,'FontWeight','normal','interpreter','latex');
%set(leg,'FontSize',14,'FontWeight','bold');

if isempty(Xlab)
    set(h,'XTickLabel',[]);
else
    xlabel(Xlab,'FontSize',fsz);
end
hold on; grid on;
plot(t,x0,'--b','LineWidth',lw);
%plot(t,x1,'-.g','LineWidth',1.9);
plot(t,x2,'-.r','LineWidth',lw);
NewYTick(h,maxdelta);