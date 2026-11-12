within OpenTEMPEST.Heat;
model ForcedConvection
  "Heat transfer correlation for forced convection (plug-in for Modelica.Fluid pipes, HeatTransfer model of DynamicPipe)"
  extends Modelica.Fluid.Pipes.BaseClasses.HeatTransfer.PartialPipeFlowHeatTransfer;

  parameter Boolean pipe=true
    "= true if flow through a pipe, false if between two parallel plates";
  final parameter Real Re_max=1e6 "Maximum Reynolds number";
  //pipe: 0.1 for turbulent flow, 0.6 for transition zone; parallel plates: 0.5 for turbulent, 0.1 for laminar flow
  Real Pr_min[n] "Minimum Prandtl number";
  //1000 for all cases but the turbulent flow between plates: 100
  final parameter Real Pr_max=1000 "Maximum Prandtl number";

protected
  Real NuLoc[n] "Nusselt numbers of the pipe correlation";
  Real tmp1[n];
  Real tmp2[n];
equation
  for j in 1:n loop
    assert(
      Prs[j] <= Pr_max,
      "Prandtl number exceeds full accuracy range",
      AssertionLevel.warning);
    assert(
      Prs[j] >= Pr_min[j],
      "Prandtl number underruns full accuracy range",
      AssertionLevel.warning);
    assert(
      Res[j] <= Re_max,
      "Reynolds number exceeds full accuracy range",
      AssertionLevel.warning);
    assert(
      diameters[j]/sum(lengths) <= 1,
      "Ratio of hydraulic diameter to length exceeds limit",
      AssertionLevel.warning);
    if pipe then
      Pr_min[j] = smooth(0, if Res[j] < 2301 then 0.1 elseif Res[j] > 10000 then 0.1 else 0.6);
      NuLoc[j] = smooth(0, if Res[j] < 2302 then (49.371 + (1.6152*(Res[j]*Prs[j]*
        diameters[j]/sum(lengths))^(1/3) - 0.7)^3 + ((2/(1 + 22*Prs[j]))^(1/6)*sqrt(Res[j]*Prs[j]*
        diameters[j]/sum(lengths)))^3)^(1/3) elseif Res[j] > 10000 then tmp2[j] else tmp1[j]);
      alphas[j] = NuLoc[j]*lambdas[j]/diameters[j];

      tmp1[j] = ((1 - (Res[j] - 2300)/(1e4 - 2300))*(49.371 + (1.615*(2300*Prs[j]*
        diameters[j]/sum(lengths))^(1/3) - 0.7)^3 + ((2/(1 + 22*Prs[j]))^(1/6)*sqrt(2300*Prs[j]*diameters[j]/
        sum(lengths)))^3)^(1/3) + ((Res[j] - 2300)/(1e4 - 2300))*(0.0308/8*1e4*Prs[j]/(1 + 12.7
        *sqrt(0.0308/8)*(Prs[j]^(2/3) - 1))*(1 + (diameters[j]/sum(lengths))^(2/3))));
      tmp2[j] = (((1.8*log10(Res[j] + 0.001) - 1.5)^(-2))/8*Res[j]*Prs[j]/(1 + 12.7*sqrt(((
        1.8*log10(Res[j] + 0.001) - 1.5)^(-2))/8)*(Prs[j]^(2/3) - 1))*(1 + (diameters[j]/sum(lengths))^(2/3)));
    else
      // Mind that the hydraulic diameter is 2*width of parallel plates!
      NuLoc[j] = 0;
      tmp1[j] = 0;
      tmp2[j] = 0;
      if Res[j] < 2200 then
        Pr_min[j] = 0.1;
        alphas[j] = lambdas[j]/diameters[j]*(7.541^3 + (1.841*(Res[j]*Prs[j]*diameters[j]/sum(lengths))^(1/3))^3)^(1
          /3);
        //for constant and equal wall temperature conditions on both sides, hydrodynamically developed flow
      elseif Res[j] > 40000 then
        Pr_min[j] = 0.5;
        alphas[j] = lambdas[j]/diameters[j]*(((1.8*log10(Res[j]) - 1.5)^(-2))/8*Res[j]*Prs[j]/(1 +
          12.7*sqrt(((1.8*log10(Res[j]) - 1.5)^(-2))/8)*(Prs[j]^(2/3) - 1))*(1 + (
          diameters[j]/sum(lengths))^(2/3)));
        //for constant wall temperature condition, Dhyd/L<=1
      else
        Pr_min[j] = 0.5;
        //assumption as no records shown
        alphas[j] = lambdas[j]/diameters[j]*((1 - (Res[j] - 2200)/(4e4 - 2200))*((3.66 + (4 - 0.102
          /1.2))^3 + (1.615*1.14*(Res[j]*Prs[j]*diameters[j]/sum(lengths))^(1/3))^3 + ((2/(1 + 22*Prs[
          j]))^(1/6)*sqrt(2300*Prs[j]*diameters[j]/sum(lengths)))^3)^(1/3) + ((Res[j] - 2200)/(4e4 -
          2200))*(0.0217/8*4e4*Prs[j]/(1 + 12.7*sqrt(0.0217/8)*(Prs[j]^(2/3) - 1))
          *(1 + (diameters[j]/sum(lengths))^(2/3))));
        //for both constant wall temperature or constant heat flux, Dhyd/L<=1
      end if;
    end if;
  end for;
  annotation (Documentation(info="<html>
<p>Forced-convection heat transfer correlations for pipe flow or flow between parallel plates, evaluated
per segment of a <code>Modelica.Fluid.Pipes.DynamicPipe</code> (use it as <code>redeclare model HeatTransfer</code>).
Previously a plug-in for the ThermoPower <code>Flow1DFV</code> heat transfer interface.</p>
</html>"));
end ForcedConvection;
