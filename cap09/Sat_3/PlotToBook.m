
function PlotToBook(ScopeData01,ScopeData02,ScopeData03,ScopeData04,ScopeData05,ScopeData06,ScopeData07,ScopeData08)
global fsz lw

close all;

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
t = ScopeData03(:,1);

% Longitudinal Elevator Plots
disp('-------         Plotting')
% clf; 
% set(gcf,'Position',[20,50,500,650]);
% set(gcf,'DefaultAxesUnits','normalized');

figure(5)
% Stick
h=subplot(1,1,1);
%title(sprintf('ELEVATOR Doublet Simulation'))
x0=ScopeData03(:,2);
%x1=ScopeData1(:,2);
x2=ScopeData03(:,3);
PlotSub2('t [s]','$p~[^{\circ}/s]$',t,x0,[],x2,h,0.01);
legend('Não linear','Linear');

figure(10)
h=subplot(1,1,1);
 a0=ScopeData04(:,2);
% a1=ylong(:,2)*RAD+yout(1,IndAlf);
 a2=ScopeData04(:,3);
PlotSub2('t [s]','$q~[^{\circ}/s]$',t,a0,[],a2,h,0.01);
legend('Não linear','Linear');


figure(15)
% Stick
h=subplot(1,1,1);
%title(sprintf('ELEVATOR Doublet Simulation'))
x0=ScopeData05(:,2);
%x1=ScopeData1(:,2);
x2=ScopeData05(:,3);
PlotSub2('t [s]','$r~[^{\circ}/s]$',t,x0,[],x2,h,.01);
legend('Não linear','Linear');



figure(20)
h=subplot(1,1,1);
a0=ScopeData06(:,2);
% a1=ylong(:,2)*RAD+yout(1,IndAlf);
a2=ScopeData06(:,3);
PlotSub2('t [s]','$\phi^{\circ}$',t,a0,[],a2,h,0.01);
legend('Não linear','Linear');

figure(25)
h=subplot(1,1,1);
 q0=ScopeData07(:,2);
% q1=ylong(:,3)*RAD+q0(1);
 q2=ScopeData07(:,3);
PlotSub2('t [s]','$\theta^{\circ}$',t,q0,[],q2,h,0.01);
legend('Não linear','Linear');

figure(30)
h=subplot(1,1,1);
q0=ScopeData08(:,2);
% q1=ylong(:,3)*RAD+q0(1);
q2=ScopeData08(:,3);
PlotSub2('t [s]','$\psi^{\circ}$',t,q0,[],q2,h,5e-3);
legend('Não linear','Linear')

figure(35)
subplot(3,1,1)
plot(ScopeData01.time,ScopeData01.signals(1).values(:,1),'LineWidth',2)
ylabel('$\phi_{ref}$','interpreter','latex', 'FontSize', 13)
grid on
subplot(3,1,2)
plot(ScopeData01.time,ScopeData01.signals(2).values(:,1),'LineWidth',2)
ylabel('$\theta_{ref}$','interpreter','latex', 'FontSize', 13)
grid on
subplot(3,1,3)
plot(ScopeData01.time,ScopeData01.signals(3).values(:,1),'LineWidth',2)
xlabel('t [s]','interpreter','latex', 'FontSize', 12)
ylabel('$\psi_{ref}$','interpreter','latex', 'FontSize', 13)
grid on

figure(40)
% Theta
 h=subplot(1,1,1);
 the0=ScopeData02.signals(1).values(:,1);
% the1=ylong(:,4)*RAD    +the0(1)+q0(1)*t;
 the2=ScopeData02.signals(1).values(:,2);
 PlotSub2('t [s]','$\tau_{1}$~[Nm]',t,the0,[],the2,h,0.01);
 legend('Não linear','Linear');
 
 figure(45)
 % Theta
 h=subplot(1,1,1);
 the0=ScopeData02.signals(2).values(:,1);
% the1=ylong(:,4)*RAD    +the0(1)+q0(1)*t;
 the2=ScopeData02.signals(2).values(:,2);
 PlotSub2('t [s]','$\tau_{2}$~[Nm]',t,the0,[],the2,h,0.01);
 legend('Não linear','Linear');
 
 figure(50)
 % Theta
 h=subplot(1,1,1);
 the0=ScopeData02.signals(3).values(:,1);
% the1=ylong(:,4)*RAD    +the0(1)+q0(1)*t;
 the2=ScopeData02.signals(3).values(:,2);
 PlotSub2('t [s]','$\tau_{3}$~[Nm]',t,the0,[],the2,h,0.01);
 legend('Não linear','Linear');

% % Nz
% h=subplot(5,1,5);
% Dq1=ylong(:,3);
% Dq2=ylong_red(:,3);
% x0=yout(:,IndNz);
% x1=ylong(:,5)    +x0(1);
% x2=ylong_red(:,5)+x0(1);
% PlotSub('t [s]','Nz [g]',t,x0,x1,x2,h,0.02);

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
%plot(t,x1,'-.g','LineWidth',2);
plot(t,x2,'-.r','LineWidth',lw);
NewYTick(h,maxdelta);